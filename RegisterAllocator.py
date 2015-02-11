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

            # ... iterate through the instructions in reverse order
            # (this does not include the preamble, stack allocation, or postamble - including return value)
            for instr in reversed(instructions):
                self.computeLiveSet(instr)
                self.updateGraph(instr)

            # now color the graph

    def computeLiveSet(self, instr):
        '''
        Algorithm:
            L_before_(k) = (L_after_(k) - write(k)) U read(k)

        Instruction     Read        Write
        -----------     ----        -----
        negl  a         {a}         {a}
        popl  a         {esp}       {a,esp}
        pushl a         {a,esp}     {esp}

        addl  a, b      {a,b}       {b}
        movl  a, b      {a}         {b}
        subl  a, b      {a,b}       {b}

        call a          {}          {eax,ecx,edx}
        '''

        readSet = set([])
        writeSet = set([])

        if self.debug >= 3:
            print "After instruction ->{}<- live set is ->{}<-".format(instr, self.afterLiveSet)

        # ... and compute the sets excluding literal values
        if isinstance(instr, x86Neg):
            self.addToSet(readSet, instr.op)
            self.addToSet(writeSet, instr.op)
        elif isinstance(instr, x86Pop):
            self.addToSet(readSet, '%esp')
            self.addToSet(writeSet, '%esp')
            self.addToSet(writeSet, instr.op)
        elif isinstance(instr, x86Push):
            self.addToSet(readSet, instr.op)
            self.addToSet(readSet, '%esp')
            self.addToSet(writeSet, '%esp')

        elif isinstance(instr, x86Add) or isinstance(instr, x86Sub):
            self.addToSet(readSet, instr.lhs)
            self.addToSet(readSet, instr.rhs)
            self.addToSet(writeSet, instr.rhs)
        elif isinstance(instr, x86Mov):
            self.addToSet(readSet, instr.lhs)
            self.addToSet(writeSet, instr.rhs)

        elif isinstance(instr, x86Call) or isinstance(instr, x86CallPtr):
            self.addToSet(writeSet, '%eax')
            self.addToSet(writeSet, '%ecx')
            self.addToSet(writeSet, '%edx')

        # compute the live set using algorithm above
        if self.debug >= 3:
            print "\tread set ->{}<-".format(readSet)
            print "\twrite set ->{}<-".format(writeSet)

        self.beforeLiveSet = (self.afterLiveSet - writeSet) | readSet
        self.afterLiveSet = self.beforeLiveSet

    def updateGraph(self, instr):
        if self.debug >= 2:
            print "for instruction ->{}<-\tthe live set is ->{}<-".format(instr, self.afterLiveSet)

        # If instruction I_k is a move: movl s, t, then add the edge (t, v)
        # for every v in L_after(k) unless v = t or v = s.
        if isinstance(instr, x86Mov):
            print "got mov"

        # If instruction I_k is not a move but some other arithmetic instruction
        # such as addl s, t, then add the edge (t, v) for every
        # v in L_after(k) unless v = t.
        if isinstance(instr, x86Add) or isinstance(instr, x86Sub):
            print "got arith"

        # If instruction I_k is of the form call label, then add an edge
        # (r, v) for every caller-save register r and every variable v in
        # L_after(k). (The caller-save registers are eax, ecx, and edx.)
        if isinstance(instr, x86Call) or isinstance(instr, x86CallPtr):
            print "got add"
            

    def addToSet(self, aSet, value):
        if False == value.startswith('$'):
            aSet.add(value)

