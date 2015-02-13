#!/usr/bin/env python

'''
@TODO: Compute interference graph
@TODO: Color the interference graph
@TODO: Generate spill code
'''

from ASTourist import *
from x86AST import *
from InterferenceGraph import *

class RegisterAllocator(object):

    '''
    Class that will peform liveness analysis and assign registers
    '''

    def __init__(self, visitor, debug=0):
        self.visitor = visitor
        self.debug = debug
        self.afterLiveSet = set([])
        self.beforeLiveSet = set([])
        self.interferenceGraph = Graph()

    def allocateRegisters(self):
        # for each activation record ...
        for rec in self.visitor.x86ast.records:
            instructions = rec.instructions

            foundHomes = False
            while False == foundHomes:
                # ... iterate through the instructions in reverse order
                # (this does not include the preamble, stack allocation, or postamble - including return value)
                for instr in reversed(instructions):
                    self.computeLiveSet(instr)
                    self.updateGraph(instr)

                # now color the graph
                graph = self.interferenceGraph.colorGraph()
                if self.debug >= 2:
                    print graph

                # generate spill code
                foundHomes = not self.detectSpills(instructions)

            # remove trivial moves
            newInstructions = self.removeTrivials(instructions)

            # assign homes
            self.assignHomes(newInstructions, graph)

            # replace the instructions with the new set
            rec.instructions = newInstructions

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
            for node in self.afterLiveSet:
                if instr.lhs != node and instr.rhs != node:
                    if self.debug >= 2:
                        print "adding arc ({}, {})".format(instr.rhs, node)
                    self.interferenceGraph.addArc(instr.rhs, node)

        # If instruction I_k is not a move but some other arithmetic instruction
        # such as addl s, t, then add the edge (t, v) for every
        # v in L_after(k) unless v = t.
        if isinstance(instr, x86Add) or isinstance(instr, x86Sub):
            for node in self.afterLiveSet:
                if instr.rhs != node:
                    if self.debug >= 2:
                        print "adding arc ({}, {})".format(instr.rhs, node)
                    self.interferenceGraph.addArc(instr.rhs, node)

        # If instruction I_k is of the form call label, then add an edge
        # (r, v) for every caller-save register r and every variable v in
        # L_after(k). (The caller-save registers are eax, ecx, and edx.)
        if isinstance(instr, x86Call) or isinstance(instr, x86CallPtr):
            for node in self.afterLiveSet:
                if self.debug >= 2:
                    print "adding arc ({}, {})".format(set(['%eax','%ecx','%edx']), node)
                self.interferenceGraph.addArc('%eax', node)
                self.interferenceGraph.addArc('%ecx', node)
                self.interferenceGraph.addArc('%edx', node)

    def __addToSet(self, aSet, value):
        if False == value.startswith('$'):
            aSet.add(value)

    def detectSpills(self, instructions):
        for instr in instructions:
            if isinstance(instr, x86TwoOpInstruction):
                if 'ebp' in instr.lhs and 'ebp' in instr.rhs:
                    print "FOUND SPILL"
        return False

    def removeTrivials(self, instructions):
        newInstructions = deque()

        for instr in instructions:
            if isinstance(instr, x86Mov):
                if instr.lhs != instr.rhs:
                    newInstructions.append(instr)
            else:
                newInstructions.append(instr)

        return newInstructions

    def assignHomes(self, instructions, graph):
        for instr in instructions:
            if self.debug >= 2:
                print "processing instruction {}".format(instr)

            # ... not sure if I should have to do this
            for key, value in graph.items():
                if key.startswith('%'):
                    continue

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

