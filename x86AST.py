#!/usr/bin/env python

from collections import deque
import sys

DEBUG = 0

##------------------------------------------------------------------##

class x86NoOpInstruction(object):

    '''
    Abstraction an x86 instruction that takes no arguments
    '''
    def __init__(self, name):
        self.name = name
        self.debug = DEBUG

        if self.debug >= 1:
            print "New Instruction:  {}".format(self.name)

    def prettyPrint(self, fd):
        fd.write("\t{}\n".format(self.__str__()))

    def __str__(self):
        return "{}".format(self.name)

##------------------------------------------------------------------##

class x86OneOpInstruction(object):

    '''
    Abstraction of a single operand x86 instruction
    '''
    def __init__(self, name, op):
        self.name = name
        self.op = op
        self.debug = DEBUG

        if self.debug >= 1:
            print "New Instruction:  {} {}".format(self.name, self.op)

    def prettyPrint(self, fd):
        fd.write("\t{}\n".format(self.__str__()))

    def __str__(self):
        return "{} {}".format(self.name, self.op)
        
##------------------------------------------------------------------##

class x86TwoOpInstruction(object):

    '''
    Abstraction of a double operand x86 instruction
    '''
    def __init__(self, name, lhs, rhs):
        self.name = name
        self.rhs = rhs
        self.lhs = lhs
        self.debug = DEBUG

        if self.debug >= 1:
            print "New Instruction:  {} {}, {}".format(self.name, self.lhs, self.rhs)

    def prettyPrint(self, fd):
        fd.write("\t{}\n".format(self.__str__()))

    def __str__(self):
        return "{} {}, {}".format(self.name, self.lhs, self.rhs)

##------------------------------------------------------------------##

class x86AST(object):

    '''
    Represents the global state of the x86 program.
    Contains a list of activation records
    '''

    def __init__(self):
        self.records = deque()  # holds a list of x86Activation objects

    def addRecord(self, record=None):
        self.records.append(record)

    '''
    Iterate over the set of activation records and print the assembly
    '''
    def prettyPrint(self, fd):
        # @TODO I'm assuming this won't always be true in the future
        fd.write(".globl main\n")

        for rec in self.records:
            rec.prettyPrint(fd)

##------------------------------------------------------------------##


class x86Activation(object):

    '''
    Represents an activation record.
    Responsible for creating stack space for all needed variables
    '''

    def __init__(self, name=None):
        self.name = name                # the name of the function
        self.preamble = x86Preamble()   # preamble code for this activation
        self.postamble = x86Postamble() # postamble code for this activation
        self.numVars = 0                # the number of variables to reserve stack space for
        self.instructions = deque()     # list of x86 instructions

    def addInstruction(self, instr=None):
        self.instructions.append(instr)

    def setNumVars(self, numVars=0):
        self.numVars = numVars

    def prettyPrint(self, fd):
        # allocate stack space
        if self.numVars != 0:
            self.instructions.appendleft(x86Sub("$" + str(self.numVars * 4), "%esp"))

        # print the name of the function
        fd.write("{}:\n".format(self.name))

        # print preamble
        self.preamble.prettyPrint(fd)

        # walk the list and print the instructions
        for instr in self.instructions:
            instr.prettyPrint(fd)

        # print the postamble
        self.postamble.prettyPrint(fd)

##------------------------------------------------------------------##


class x86Preamble(object):

    '''
    Represents the preamble code to an activation
    '''

    def __init__(self):
        self.instructions = deque()
        self.instructions.append(x86Push("%ebp"))
        self.instructions.append(x86Mov("%esp", "%ebp"))

    def prettyPrint(self, fd):
        for instr in self.instructions:
            instr.prettyPrint(fd)

##------------------------------------------------------------------##


class x86Postamble(object):

    '''
    Represents the postamble code to an activation
    '''

    def __init__(self):
        self.instructions = deque()

        # Return value is put into %eax
        # @TODO - return value is hard coded for now
        self.instructions.append(x86Mov('$0', '%eax'))

        self.instructions.append(x86Leave())
        self.instructions.append(x86Ret())

    def prettyPrint(self, fd):
        for instr in self.instructions:
            instr.prettyPrint(fd)

##------------------------------------------------------------------##


class x86Add(x86TwoOpInstruction):

    '''
    Abstraction of the x86 addl instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        super(x86Add, self).__init__("addl", lhs, rhs)

    def prettyPrint(self, fd):
        super(x86Add, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Call(x86OneOpInstruction):

    '''
    Abstraction of the x86 call instruction
    '''

    def __init__(self, func=None):
        super(x86Call, self).__init__("call", func)

    def prettyPrint(self, fd):
        super(x86Call, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86CallPtr(x86OneOpInstruction):

    '''
    Abstraction of the x86 call* instruction
    '''

    def __init__(self, func=None):
        super(x86CallPtr, self).__init__("call*", func)

    def prettyPrint(self, fd):
        super(x86CallPtr, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Cmp(x86TwoOpInstruction):

    '''
    Abstraction of the x86 cmpl instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        super(x86Cmp, self).__init__("cmpl", lhs, rhs)

    def prettyPrint(self, fd):
        super(x86Cmp, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Je(x86OneOpInstruction):

    '''
    Abstraction of the x86 je instruction
    '''

    def __init__(self, label=None):
        super(x86Je, self).__init__("je", label)

    def prettyPrint(self, fd):
        super(x86Je, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Jmp(x86OneOpInstruction):

    '''
    Abstraction of the x86 jmp instruction
    '''

    def __init__(self, label=None):
        super(x86Jmp, self).__init__("jmp", label)

    def prettyPrint(self, fd):
        super(x86Jmp, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Leave(x86NoOpInstruction):

    '''
    Abstraction of the x86 leave instruction
    '''

    def __init__(self):
        super(x86Leave, self).__init__("leave")

    def prettyPrint(self, fd):
        super(x86Leave, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Mov(x86TwoOpInstruction):

    '''
    Abstraction of the x86 movl instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        super(x86Mov, self).__init__("movl", lhs, rhs)

    def prettyPrint(self, fd):
        super(x86Mov, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Movzb(x86TwoOpInstruction):

    '''
    Abstraction of the x86 movzbl instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        super(x86Movzb, self).__init__("movzbl", lhs, rhs)

    def prettyPrint(self, fd):
        super(x86Movzb, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Neg(x86OneOpInstruction):

    '''
    Abstraction of the x86 negl instruction
    '''

    def __init__(self, reg=None):
        super(x86Neg, self).__init__("negl", reg)

    def prettyPrint(self, fd):
        super(x86Neg, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Not(x86OneOpInstruction):

    '''
    Abstraction of the x86 notl instruction
    '''

    def __init__(self, reg=None):
        super(x86Not, self).__init__("notl", reg)

    def prettyPrint(self, fd):
        super(x86Not, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Or(x86TwoOpInstruction):

    '''
    Abstraction of the x86 orl instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        super(x86Or, self).__init__("orl", lhs, rhs)

    def prettyPrint(self, fd):
        super(x86Or, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86And(x86TwoOpInstruction):

    '''
    Abstraction of the x86 andl instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        super(x86And, self).__init__("andl", lhs, rhs)

    def prettyPrint(self, fd):
        super(x86And, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Pop(x86OneOpInstruction):

    '''
    Abstraction of the x86 popl instruction
    '''

    def __init__(self, reg=None):
        super(x86Pop, self).__init__("popl", reg)

    def prettyPrint(self, fd):
        super(x86Pop, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Push(x86OneOpInstruction):

    '''
    Abstraction of the x86 pushl instruction
    '''

    def __init__(self, reg=None):
        super(x86Push, self).__init__("pushl", reg)

    def prettyPrint(self, fd):
        super(x86Push, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Ret(x86NoOpInstruction):

    '''
    Abstraction of the x86 ret instruction
    '''

    def __init__(self):
        super(x86Ret, self).__init__("ret")

    def prettyPrint(self, fd):
        super(x86Ret, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Sal(x86TwoOpInstruction):

    '''
    Abstraction of the x86 sall instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        super(x86Sal, self).__init__("sall", lhs, rhs)

    def prettyPrint(self, fd):
        super(x86Sal, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Sar(x86TwoOpInstruction):

    '''
    Abstraction of the x86 sarl instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        super(x86Sar, self).__init__("sarl", lhs, rhs)

    def prettyPrint(self, fd):
        super(x86Sar, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Sete(x86OneOpInstruction):

    '''
    Abstraction of the x86 sete instruction
    '''

    def __init__(self, reg=None):
        super(x86Sete, self).__init__("sete", reg)

    def prettyPrint(self, fd):
        super(x86Sete, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Setne(x86OneOpInstruction):

    '''
    Abstraction of the x86 setne instruction
    '''

    def __init__(self, reg=None):
        super(x86Setne, self).__init__("setne", reg)

    def prettyPrint(self, fd):
        super(x86Setne, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Sub(x86TwoOpInstruction):

    '''
    Abstraction of the x86 subl instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        super(x86Sub, self).__init__("subl", lhs, rhs)

    def prettyPrint(self, fd):
        super(x86Sub, self).prettyPrint(fd)

