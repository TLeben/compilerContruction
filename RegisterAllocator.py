#!/usr/bin/env python

from ASTourist import *
from x86AST import *

class RegisterAllocator(object):

    '''
    Class that will peform liveness analysis and assign registers
    '''

    def __init__(self, visitor, debug=0):
        self.visitor = visitor
        self.debug = debug
        self.liveSet = set([])

    def livenessAnalysis(self):
        '''
        We don't have to worry about call for the P0 language

        Instruction     Read    Write
        -----------     ----    -----
        addl  a, b      {a,b}   {b}
        movl  a, b      {a,b}   {b}
        negl  a         {a}     {a}
        popl  a         {}      {a}
        pushl a         {a}     {}
        subl  a, b      {a,b}   {b}


        Algorithm:
            L_before_(k) = (L_after_(k) - write(k)) U read(k)
        '''

        if self.debug >= 1:
            print "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"

        records = self.visitor.x86ast.records

        # for each activation record ...
        for rec in records:
            instructions = rec.instructions

            # ... iterate through the instructions in reverse order
            for instr in reversed(instructions):
                if self.debug >= 2:
                    print instr

                readSet = set([])
                writeSet = set([])
                afterLiveSet = self.liveSet

                # compute the sets excluding literal values
                if isinstance(instr, x86Add) or isinstance(instr, x86Mov) or isinstance(instr, x86Sub):
                    self.addToSet(readSet, instr.lhs)
                    self.addToSet(readSet, instr.rhs)
                    self.addToSet(writeSet, instr.rhs)
                elif isinstance(instr, x86Neg):
                    self.addToSet(readSet, instr.op)
                    self.addToSet(writeSet, instr.op)
                elif isinstance(instr, x86Pop):
                    self.addToSet(writeSet, instr.op)
                elif isinstance(instr, x86Push):
                    self.addToSet(readSet, instr.op)

                # compute the live set
                self.liveSet = (afterLiveSet - writeSet) | readSet
                if self.debug >= 1:
                    print self.liveSet
                
        if self.debug >= 1:
            print "\n\n~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"

    def addToSet(self, aSet, value):
        if self.debug >= 2:
            print value

        if False == value.startswith('$'):
            aSet.add(value)

