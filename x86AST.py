#!/usr/bin/python

from collections import deque
import sys

'''
@TODO It would be nice to make some sort of meta-instructions like do_print which puts the argument on the stack, calls print, and pops the stack
'''

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

        while self.records:
            self.records.popleft().prettyPrint(fd)

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
            self.instructions.appendleft(
                x86Sub("$" + str(self.numVars * 4), "%esp"))

        # print the name of the function
        fd.write("{}:\n".format(self.name))

        # print preamble
        self.preamble.prettyPrint(fd)

        # walk the list and print the instructions
        while self.instructions:
            self.instructions.popleft().prettyPrint(fd)

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
        while self.instructions:
            self.instructions.popleft().prettyPrint(fd)

##------------------------------------------------------------------##


class x86Postamble(object):

    '''
    Represents the postamble code to an activation
    '''

    def __init__(self):
        self.instructions = deque()
        self.instructions.append(x86Leave())
        self.instructions.append(x86Ret())

    def prettyPrint(self, fd):
        while self.instructions:
            self.instructions.popleft().prettyPrint(fd)

##------------------------------------------------------------------##


class x86Add(object):

    '''
    Abstraction of the x86 addl instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        self.lhs = lhs
        self.rhs = rhs

    def prettyPrint(self, fd):
        fd.write("\taddl {}, {}\n".format(self.lhs, self.rhs))

##------------------------------------------------------------------##


class x86Call(object):

    '''
    Abstraction of the x86 call instruction
    '''

    def __init__(self, func=None):
        self.func = func

    def prettyPrint(self, fd):
        fd.write("\tcall {}\n".format(self.func))

##------------------------------------------------------------------##


class x86CallPtr(object):

    '''
    Abstraction of the x86 call* instruction
    '''

    def __init__(self, func=None):
        self.func = func

    def prettyPrint(self, fd):
        fd.write("\tcall *{}\n".format(self.func))

##------------------------------------------------------------------##


class x86Cmpl(object):

    '''
    Abstraction of the x86 cmpl instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        self.lhs = lhs
        self.rhs = rhs

    def prettyPrint(self, fd):
        fd.write("\tcmpl {}, {}\n".format(self.lhs, self.rhs))

##------------------------------------------------------------------##


class x86Je(object):

    '''
    Abstraction of the x86 je instruction
    '''

    def __init__(self, label=None):
        self.label = label

    def prettyPrint(self, fd):
        fd.write("\tje {}\n".format(self.label))

##------------------------------------------------------------------##


class x86Jmp(object):

    '''
    Abstraction of the x86 jmp instruction
    '''

    def __init__(self, label=None):
        self.label = label

    def prettyPrint(self, fd):
        fd.write("\tjmp {}\n".format(self.label))

##------------------------------------------------------------------##


class x86Leave(object):

    '''
    Abstraction of the x86 leave instruction
    '''

    def prettyPrint(self, fd):
        fd.write("\tleave\n")

##------------------------------------------------------------------##


class x86Mov(object):

    '''
    Abstraction of the x86 movl instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        self.lhs = lhs
        self.rhs = rhs

    def prettyPrint(self, fd):
        fd.write("\tmovl {}, {}\n".format(self.lhs, self.rhs))

##------------------------------------------------------------------##


class x86Movzbl(object):

    '''
    Abstraction of the x86 movzbl instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        self.lhs = lhs
        self.rhs = rhs

    def prettyPrint(self, fd):
        fd.write("\tmovzbl {}, {}\n".format(self.lhs, self.rhs))

##------------------------------------------------------------------##


class x86Neg(object):

    '''
    Abstraction of the x86 negl instruction
    '''

    def __init__(self, reg=None):
        self.reg = reg

    def prettyPrint(self, fd):
        fd.write("\tnegl {}\n".format(self.reg))

##------------------------------------------------------------------##


class x86Not(object):

    '''
    Abstraction of the x86 notl instruction
    '''

    def __init__(self, reg=None):
        self.reg = reg

    def prettyPrint(self, fd):
        fd.write("\tnotl {}\n".format(self.reg))

##------------------------------------------------------------------##


class x86Or(object):

    '''
    Abstraction of the x86 orl instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        self.lhs = lhs
        self.rhs = rhs

    def prettyPrint(self, fd):
        fd.write("\torl {}, {}\n".format(self.lhs, self.rhs))

##------------------------------------------------------------------##


class x86And(object):

    '''
    Abstraction of the x86 andl instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        self.lhs = lhs
        self.rhs = rhs

    def prettyPrint(self, fd):
        fd.write("\tandl {}, {}\n".format(self.lhs, self.rhs))

##------------------------------------------------------------------##


class x86Pop(object):

    '''
    Abstraction of the x86 popl instruction
    '''

    def __init__(self, reg=None):
        self.reg = reg

    def prettyPrint(self, fd):
        fd.write("\tpopl {}\n".format(self.reg))

##------------------------------------------------------------------##


class x86Push(object):

    '''
    Abstraction of the x86 pushl instruction
    '''

    def __init__(self, reg=None):
        self.reg = reg

    def prettyPrint(self, fd):
        fd.write("\tpushl {}\n".format(self.reg))

##------------------------------------------------------------------##


class x86Ret(object):

    '''
    Abstraction of the x86 ret instruction
    '''

    def prettyPrint(self, fd):
        fd.write("\tret\n")

##------------------------------------------------------------------##


class x86Sall(object):

    '''
    Abstraction of the x86 sall instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        self.lhs = lhs
        self.rhs = rhs

    def prettyPrint(self, fd):
        fd.write("\tsall {}, {}\n".format(self.lhs, self.rhs))

##------------------------------------------------------------------##


class x86Sarl(object):

    '''
    Abstraction of the x86 sarl instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        self.lhs = lhs
        self.rhs = rhs

    def prettyPrint(self, fd):
        fd.write("\tsarl {}, {}\n".format(self.lhs, self.rhs))

##------------------------------------------------------------------##


class x86Sete(object):

    '''
    Abstraction of the x86 sete instruction
    '''

    def __init__(self, reg=None):
        self.reg = reg

    def prettyPrint(self, fd):
        fd.write("\tsete {}\n".format(self.reg))

##------------------------------------------------------------------##


class x86Setne(object):

    '''
    Abstraction of the x86 setne instruction
    '''

    def __init__(self, reg=None):
        self.reg = reg

    def prettyPrint(self, fd):
        fd.write("\tsetne {}\n".format(self.reg))

##------------------------------------------------------------------##


class x86Sub(object):

    '''
    Abstraction of the x86 subl instruction
    '''

    def __init__(self, lhs=None, rhs=None):
        self.lhs = lhs
        self.rhs = rhs

    def prettyPrint(self, fd):
        fd.write("\tsubl {}, {}\n".format(self.lhs, self.rhs))

##------------------------------------------------------------------##


class x86MetaPrintInt(object):

    '''
    Higher level representation of a call to print_int_nl
    '''

    def __init__(self, intVal=0, reg=None):
        # attributes
        #   intVal      the integer value to print                      example:  42
        #   reg         the name of the register to store the value     example:  -4(%ebp)
        self.intVal = intVal
        self.reg = reg
        self.instructions = deque()

        # create the list of instructions
        # Push arg we want to print to the stack
        if reg is None:
            # push an integer ie pushl $42
            self.instructions.append(x86Push("$" + str(intVal)))
        else:
            # push a mem-location to the stack, ie pushl -12(%ebp)
            self.instructions.append(x86Push(reg))
        # call print_int_nl
        self.instructions.append(x86Call("print_int_nl"))
        # pop the stack 
        self.instructions.append(x86Add("$4", "%esp"))

    def prettyPrint(self, fd):
        while self.instructions:
            self.instructions.popleft().prettyPrint(fd)

