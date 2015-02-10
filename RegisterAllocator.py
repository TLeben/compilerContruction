#!/usr/bin/env python

'''
@TODO: Verify liveness analysis
@TODO: Compute interference graph
@TODO: Color the interference graph
@TODO: Generate spill code
'''

from ASTourist import *
from x86AST import *

class RegisterAllocator(object):

    '''
    Class that will peform liveness analysis and assign registers
    '''

    def __init__(self, visitor, debug=0):
        self.visitor = visitor
        self.debug = debug

    def livenessAnalysis(self):
        '''
        We don't have to worry about call for the P0 language

        Instruction     Read        Write
        -----------     ----        -----
        addl  a, b      {a,b}       {b}
        movl  a, b      {a}         {b}
        negl  a         {a}         {a}
        popl  a         {esp}       {a,esp}
        pushl a         {a,esp}     {esp}
        subl  a, b      {a,b}       {b}


        Algorithm:
            L_before_(k) = (L_after_(k) - write(k)) U read(k)
        '''

        records = self.visitor.x86ast.records
        beforeLiveSet = set([])
        afterLiveSet = set([])

        # for each activation record ...
        for rec in records:
            instructions = rec.instructions

            # ... iterate through the instructions in reverse order
            # this does not include the preamble, stack allocation, or postamble (including return value)
            for instr in reversed(instructions):
                readSet = set([])
                writeSet = set([])

                if self.debug >= 1:
                    print "After instruction ->{}<- live set is ->{}<-".format(instr, afterLiveSet)

                # compute the sets excluding literal values
                if isinstance(instr, x86Add) or isinstance(instr, x86Sub):
                    self.addToSet(readSet, instr.lhs)
                    self.addToSet(readSet, instr.rhs)
                    self.addToSet(writeSet, instr.rhs)
                elif isinstance(instr, x86Mov):
                    self.addToSet(readSet, instr.lhs)
                    self.addToSet(writeSet, instr.rhs)
                elif isinstance(instr, x86Neg):
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

                # compute the live set
                if self.debug >= 3:
                    print "\tread set ->{}<-".format(readSet)
                    print "\twrite set ->{}<-".format(writeSet)

                beforeLiveSet = (afterLiveSet - writeSet) | readSet
                afterLiveSet = beforeLiveSet
                
    def addToSet(self, aSet, value):
        if False == value.startswith('$'):
            aSet.add(value)

