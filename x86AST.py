#!/usr/bin/env python

from collections import deque
from pyAST import *
import sys

DEBUG = 0



##------------------------------------------------------------------##

class x86NoOpInstruction(Node):

    '''
    Abstraction an x86 instruction that takes no arguments
    '''
    def __init__(self, name):
        self.name = name
        self.debug = DEBUG

        if self.debug >= 1:
            print "New Instruction:  {}".format(self.name)

    def prettyPrint(self, fd):
        fd.write("\t{}\n".format(self.__repr__()))

    def __repr__(self):
        return "{}".format(self.name)

##------------------------------------------------------------------##

class x86OneOpInstruction(Node):

    '''
    Abstraction of a single operand x86 instruction
    '''
    def __init__(self, name, op):
        self.name = name
        self.op = op
        self.liveSetBefore= set()
        self.liveSetAfter = set()
        self.debug = DEBUG

        if self.debug >= 1:
            print "New Instruction:  {} {}".format(self.name, self.op)

    def prettyPrint(self, fd):
        fd.write("\t{}\n".format(self.__repr__()))

    def __repr__(self):
        return "{} {}".format(self.name, self.op)
        
##------------------------------------------------------------------##

class x86TwoOpInstruction(Node):

    '''
    Abstraction of a double operand x86 instruction
    '''
    def __init__(self, name, lhs=None, rhs=None):
        self.name = name
        self.rhs = rhs
        self.lhs = lhs
        self.liveSetBefore = set()
        self.liveSetAfter = set()
        self.debug = DEBUG

        if self.debug >= 1:
            print "New Instruction:  {} {}, {}".format(self.name, self.lhs, self.rhs)

    def prettyPrint(self, fd):
        fd.write("\t{}\n".format(self.__repr__()))

    def __repr__(self):
        return "{} {}, {}".format(self.name, self.lhs, self.rhs)

class x86ThreeOpInstruction(Node):

    '''
    Abstraction of a double operand x86 instruction
    '''
    def __init__(self, name, lhs=None, mhs=None, rhs=None):
        self.name = name
        self.rhs = rhs
        self.mhs = mhs
        self.lhs = lhs
        self.liveSetBefore = set()
        self.liveSetAfter = set()
        self.debug = DEBUG

        if self.debug >= 1:
            print "New Instruction:  {} {}, {}, {}".format(
                self.name, self.lhs, self.mhs, self.rhs)

    def prettyPrint(self, fd):
        fd.write("\t{}\n".format(self.__repr__()))

    def __repr__(self):
        return "{} {}, {}".format(self.name, self.lhs, self.rhs)
##------------------------------------------------------------------##


class x86AST(Node):

    '''
    Represents the global state of the x86 program.
    Contains a list of activation records
    ** like module
    '''

    def __init__(self, actRecords):
        self.records = actRecords  # holds a list of x86Activation objects

    def addRecord(self, record=None):
        self.records.append(record)

    '''
    Iterate over the set of activation records and print the assembly
    '''
    def prettyPrint(self, fd=None):
        # @TODO I'm assuming this won't always be true in the future
        #fd.write(".globl main\n") ###   label

        for rec in self.records:
            rec.prettyPrint(fd)

##------------------------------------------------------------------##


class x86Activation(Node):

    '''
    Represents an activation record.
    Responsible for creating stack space for all needed variables
    ** like stmt list
    '''

    def __init__(self, name=None):
        self.name = name                # the name of the function
        self.preamble = x86Preamble()   # preamble code for this activation
        self.postamble = x86Postamble() # postamble code for this activation
        self.instructions = []     # list of x86 instructions

    def addInstruction(self, instr=None):
        self.instructions += instr

    def prettyPrint(self, fd):
        # print the name of the function
        fd.write("{}:\n".format(self.name))

        # print preamble
        self.preamble.prettyPrint(fd)

        # figure out the size of the stack
        stack = set([])
        for instr in self.instructions:
            if isinstance(instr, x86OneOpInstruction) and '(%ebp)' in instr.op:
                stack.add(instr.op)
            elif isinstance(instr, x86TwoOpInstruction) and '(%ebp)' in instr.rhs:
                stack.add(instr.rhs)
            elif isinstance(instr, x86TwoOpInstruction) and '(%ebp)' in instr.lhs:
                stack.add(instr.lhs)

        x86Sub(x86Const(str(len(stack))), x86Register('esp')).prettyPrint(fd)

        # walk the list and print the instructions
        for instr in self.instructions:
            instr.prettyPrint(fd)

        # print the postamble
        self.postamble.prettyPrint(fd)

##------------------------------------------------------------------##


class x86Preamble(object):

    '''
    Represents the preamble code to an activation.  Also handles allocating stack space
    '''

    def __init__(self):
        self.instructions = deque()

        # these are always the first two instructions

        self.instructions.append(x86Push(x86Register("ebp")))
        self.instructions.append(x86Mov(x86Register('esp'), x86Register('ebp')))

    def prettyPrint(self, fd):
        for instr in self.instructions:
            instr.prettyPrint(fd)

##------------------------------------------------------------------##


class x86Postamble(object):

    '''
    Represents the postamble code to an activation
    '''

    def __init__(self, localList):
        self.instructions = []
        for r in reversed(calleeSaveRegs):
            self.instructions.append(x86Pop(x86Register(r)))
        # Return value is put into %eax
        # @TODO - return value is hard coded for now
        self.instructions.append(x86Add(x86Const(len(localList)*4),
                                        x86Register('esp')))
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
        self.name = 'addl'
        self.lhs = lhs
        self.rhs = rhs

    def prettyPrint(self, fd):
        super(x86Add, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Call(x86OneOpInstruction):

    '''
    Abstraction of the x86 call instruction
    '''

    def __init__(self, func=None):

        self.op = 'call'
        self.name = func

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
        self.name = 'cmpl'
        self.lhs = lhs
        self.rhs = rhs

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
       self.name = 'leave'

    def prettyPrint(self, fd):
        super(x86Leave, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Mov(x86TwoOpInstruction):

    '''
    Abstraction of the x86 movl instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        self.lhs = lhs
        self.rhs = rhs
        self.name = 'movl'


    def prettyPrint(self, fd):
        super(x86Mov, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Movzb(x86TwoOpInstruction):

    '''
    Abstraction of the x86 movzbl instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        self.name = 'movzbl'
        self.lhs = lhs
        self.rhs = rhs

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
        self.name = 'orl'
        self.lhs = lhs
        self.rhs = rhs

    def prettyPrint(self, fd):
        super(x86Or, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86And(x86TwoOpInstruction):

    '''
    Abstraction of the x86 andl instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        self.name = 'andl'
        self.lhs = lhs
        self.rhs = rhs

    def prettyPrint(self, fd):
        super(x86And, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Pop(x86OneOpInstruction):

    '''
    Abstraction of the x86 popl instruction
    '''

    def __init__(self, reg=None):
        self.name = 'popl'
        self.op = reg


    def prettyPrint(self, fd):
        super(x86Pop, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Push(x86OneOpInstruction):

    '''
    Abstraction of the x86 pushl instruction
    '''

    def __init__(self, reg=None):

        self.name = 'pushl'
        self.op = reg

    def prettyPrint(self, fd):
        super(x86Push, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Ret(x86NoOpInstruction):

    '''
    Abstraction of the x86 ret instruction
    '''

    def __init__(self):

        self.name = 'ret'

    def prettyPrint(self, fd):
        super(x86Ret, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Sal(x86TwoOpInstruction):

    '''
    Abstraction of the x86 sall instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        self.name = 'sall'
        self.lhs = lhs
        self.rhs = rhs

    def prettyPrint(self, fd):
        super(x86Sal, self).prettyPrint(fd)

##------------------------------------------------------------------##


class x86Sar(x86TwoOpInstruction):

    '''
    Abstraction of the x86 sarl instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        self.name = 'sarl'
        self.lhs = lhs
        self.rhs = rhs

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
        self.name = 'subl'
        self.lhs = lhs
        self.rhs = rhs


    def prettyPrint(self, fd):
        super(x86Sub, self).prettyPrint(fd)


##-----------------------------------
# non standards

class x86If(x86ThreeOpInstruction):

    def __init__(self, lhs=None, mhs=None, rhs=None):
        self.name = '_If'
        self.lhs = lhs
        self.mhs = mhs
        self.rhs = rhs
        self.operandList = [lhs, mhs, rhs]

    def __str__(self):
        ret = ""
        for i in range(3):
            for inst in self.operandList[i]:
                ret += "-"*(i+1) + ">" + repr(inst)+"\n"
        return ret


class x86Const(x86NoOpInstruction):


    def __repr__(self):
        return '${}'.format(self.name)

class x86Register(x86NoOpInstruction):

    def __init__(self, reg):

        self.name = reg

    def __repr__(self):
        return '%{}'.format(self.name)

    def __eq__(self, other):
        if not isinstance(other, x86Register):
            return False
        return self.reg == other.reg

class x86StkLoc(x86NoOpInstruction):

    def __init__(self, offset):
        self.name = offset

    def __repr__(self):
        return '-{}(%ebp)'.format(self.name)

    def __eq__(self, other):
        if not isinstance(other, x86StkLoc):
            return False
        return self.name == other.name

class x86Label(x86NoOpInstruction):

    def __int__(self, label):
        super(x86Label,self).__init__(label)
        self.name = label

    def __repr__(self):
        return '{}:'.format(self.name)

class x86Var(x86NoOpInstruction):

    def __init__(self, name):
        self.name = name

    def __repr__(self):
        return '{}'.format(self.name)




