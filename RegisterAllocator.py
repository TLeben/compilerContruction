#!/usr/bin/env python

import copy

from x86AST import *
from InterferenceGraph import *


class RegisterAllocator(object):

    '''
    Class that will implement most of the register allocation
        1. LOOP
            1. Perform liveness analysis
            2. Add nodes / edges to interference graph
            3. Delegate coloring to InterferenceGraph
            4. Detect spills and add instructions to handle
            5. If spills, return to step 1. otherwise exit loop

        3. Remove trivial instructions (movl a, a)
        2. Assign temporary variables registers
    '''

    def __init__(self, visitor, debug=0):
        self.visitor = visitor
        self.debug = debug
        self.afterLiveSet = set([])
        self.beforeLiveSet = set([])
        self.interferenceGraph = Graph()
        self.stackPos = 0

    def allocateRegisters(self):
        # for each activation record ...
        for rec in self.visitor.x86ast.records:
            instructions = rec.instructions

            allocated = False
            while False == allocated:
                # ... iterate through the instructions in reverse order
                # (this does not include the preamble, stack allocation, or postamble - including return value)
                for instr in reversed(instructions):
                    # ignore stack manipulation instructions
                    if isinstance(instr, x86Add) and instr.rhs == '%esp':
                        continue
                    
                    self.computeLiveSet(instr)
                    self.updateGraph(instr)

                # now color the graph
                graph = self.interferenceGraph.colorGraph()

                if self.debug >= 2:
                    print "\n{}\n".format(graph)

                if isinstance(graph, tuple) and False == graph[0]:
                    allocated = False
                    graph = graph[1]
                else:
                    allocated = True

                # generate spill code
                args = list(self.detectSpills(instructions, graph))
                allocated = not args[0]
                instructions = args[1]

#                time.sleep(1)
                allocated = True

            # remove trivial moves
            instructions = self.removeTrivials(instructions)

            # assign homes
            instructions = self.assignHomes(instructions, graph, True)

            # replace the instructions with the new set
            rec.instructions = instructions

    def computeLiveSet(self, instr):
        '''
        Algorithm:
            L_before_(k) = (L_after_(k) - write(k)) U read(k)

        Instruction     Read        Write
        -----------     ----        -----
        negl  a         {a}         {a}
        popl  a         {}          {a}
        pushl a         {a}         {}

        addl  a, b      {a,b}       {b}
        movl  a, b      {a}         {b}
        subl  a, b      {a,b}       {b}
        '''

        readSet = set([])
        writeSet = set([])

        if self.debug >= 3:
            print "After instruction ->{}<- live set is ->{}<-".format(instr, self.afterLiveSet)

        # ... and compute the sets excluding literal values
        if isinstance(instr, x86Neg):
            self.__addToSet(readSet, instr.op)
            self.__addToSet(writeSet, instr.op)
        elif isinstance(instr, x86Pop):
            self.__addToSet(writeSet, instr.op)
        elif isinstance(instr, x86Push):
            self.__addToSet(readSet, instr.op)
        elif isinstance(instr, x86Add) or isinstance(instr, x86Sub):
            self.__addToSet(readSet, instr.lhs)
            self.__addToSet(readSet, instr.rhs)
            self.__addToSet(writeSet, instr.rhs)
        elif isinstance(instr, x86Mov):
            self.__addToSet(readSet, instr.lhs)
            self.__addToSet(writeSet, instr.rhs)

        # compute the live set using algorithm above
        if self.debug >= 3:
            print "\tread set ->{}<-".format(readSet)
            print "\twrite set ->{}<-".format(writeSet)

        self.beforeLiveSet = (self.afterLiveSet - writeSet) | readSet
        self.afterLiveSet = self.beforeLiveSet

    def updateGraph(self, instr):
        if self.debug >= 3:
            print "for instruction ->{}<-\tthe live set is ->{}<-".format(instr, self.afterLiveSet)

        
        # If instruction I_k is a move: movl s, t, then add the edge (t, v)
        # for every v in L_after(k) unless v = t or v = s.
        if isinstance(instr, x86Mov):
            self.__addToGraph(instr.lhs)
            self.__addToGraph(instr.rhs)

            for node in self.afterLiveSet:
                if instr.lhs != node and instr.rhs != node:
                    if self.debug >= 2:
                        print "Mov: adding arc ({}, {})".format(instr.rhs, node)
                    self.interferenceGraph.addArc(instr.rhs, node)

        # If instruction I_k is not a move but some other arithmetic instruction
        # such as addl s, t, then add the edge (t, v) for every
        # v in L_after(k) unless v = t.
        elif isinstance(instr, x86Add) or isinstance(instr, x86Sub):
            self.__addToGraph(instr.lhs)
            self.__addToGraph(instr.rhs)

            for node in self.afterLiveSet:
                if instr.rhs != node:
                    if self.debug >= 2:
                        print "Add: adding arc ({}, {})".format(instr.rhs, node)
                    self.interferenceGraph.addArc(instr.rhs, node)

        # If instruction I_k is of the form call label, then add an edge
        # (r, v) for every caller-save register r and every variable v in
        # L_after(k). (The caller-save registers are eax, ecx, and edx.)
#        elif isinstance(instr, x86Call) or isinstance(instr, x86CallPtr):
#            for node in self.afterLiveSet:
#                if self.debug >= 2:
#                    print "adding arc ({}, {})".format(set(['%eax','%ecx','%edx']), node)
#                self.interferenceGraph.addArc('%eax', node)
#                self.interferenceGraph.addArc('%ecx', node)
#                self.interferenceGraph.addArc('%edx', node)


    def __addToSet(self, aSet, value):
        if False == value.startswith('$'):
            if False == value.startswith('%'):
                aSet.add(value)

    def __addToGraph(self, node):
         if False == node.startswith('%') and False == node.startswith('$'):
            if self.debug >= 2:
                print "adding node {}".format(node)
            self.interferenceGraph.addNode(node)

    def detectSpills(self, instructions, graph):
        newInstructions = deque()
        homedInstructions = self.assignHomes(instructions, graph, False)
        foundSpill = False

        if 0 == len(homedInstructions):
            return instructions

        for instr in homedInstructions:
            if isinstance(instr, x86TwoOpInstruction) and '%ebp' in instr.lhs and '%ebp' in instr.rhs:
                if self.debug >= 2:
                    print "FOUND SPILL {}".format(instr)
                newTemp = self.visitor.getNextTemp()
                newInstructions.append(x86Mov(instr.lhs, newTemp))
                newInstructions.append(x86Mov(newTemp, instr.rhs))
                instructions.popleft()
                foundSpill = True
            else:
                newInstructions.append(instructions.popleft())

        return (foundSpill, newInstructions)

    def removeTrivials(self, instructions):
        newInstructions = deque()

        for instr in instructions:
            if isinstance(instr, x86Mov):
                if instr.lhs != instr.rhs:
                    newInstructions.append(instr)
            else:
                newInstructions.append(instr)

        return newInstructions

    def assignHomes(self, instructions, graph, remember):
        if 0 == len(graph.items()):
            return

        homedInstructions = copy.deepcopy(instructions)
        # assign graph registers
        for instr in homedInstructions:
            if self.debug >= 2:
                print "processing instruction {}".format(instr)

            for key, value in graph.items():
                if isinstance(instr, x86OneOpInstruction):
                    if instr.op == key:
                        if self.debug >= 2:
                            print "\tOne op:  assigning {} to {}".format(instr.op, value)
                        instr.op = value

                if isinstance(instr, x86TwoOpInstruction):
                    if instr.rhs == key:
                        if self.debug >= 2:
                            print "\tTwo op:  assigning {} to {}".format(instr.rhs, value)
                        instr.rhs = value
                    
                    if instr.lhs == key:
                        if self.debug >= 2:
                            print "\tTwo op:  assigning {} to {}".format(instr.lhs, value)
                        instr.lhs = value

            # otherwise throw it on the stack
            if isinstance(instr, x86Call) or isinstance(instr, x86CallPtr):
                continue
            if isinstance(instr, x86OneOpInstruction) and not instr.op.startswith('%') and not instr.op.startswith('$') and not instr.op.startswith('-'):
                instr.op = self.getNextStackPos(remember)
            if isinstance(instr, x86TwoOpInstruction) and not instr.lhs.startswith('%') and not instr.lhs.startswith('$') and not instr.lhs.startswith('-'):
                instr.lhs = self.getNextStackPos(remember)
            if isinstance(instr, x86TwoOpInstruction) and not instr.rhs.startswith('%') and not instr.rhs.startswith('$') and not instr.rhs.startswith('-'):
                instr.rhs = self.getNextStackPos(remember)

        return homedInstructions

    def getNextStackPos(self, remember):
        print "stack"
        tmp = '-' + str((self.stackPos + 1) * 4) + '(%ebp)'
        if remember:
            self.stackPos += 1
        return tmp

