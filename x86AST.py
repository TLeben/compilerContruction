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

	def __init__(self, outFile=None):
		self.records = deque()	# holds a list of x86Activation objects
		self.outFile = outFile	# where to write output

	def addRecord(self, record=None):
		self.records.append(record)

	'''
	Iterate over the set of activation records and print the assembly
	'''
	def prettyPrint(self):
		# open the file
		fd = open(self.outFile, "w")

		# @TODO I'm assuming this won't always be true in the future
		fd.write(".globl main\n")

		while self.records:
			rec = self.records.popleft()
			rec.prettyPrint(fd)

		# close the file
		fd.close()

##------------------------------------------------------------------##

class x86Activation(object):

	'''
	Represents an activation record.
	Responsible for creating stack space for all needed variables
	'''

	def __init__(self, name=None):
		self.name = name					# the name of the function
		self.preamble = x86Preamble()		# preamble code for this activation
		self.postamble = x86Postamble()		# postamble code for this activation
		self.numVars = 0					# the number of variables to reserve stack space for
		self.instructions = deque()			# list of x86 instructions

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

if __name__ == "__main__":

	if len(sys.argv) != 2:
		print 'Usage: %s <assemblyFile.s>' % (sys.argv[0])
		raise SystemExit(1)

	if sys.argv[1][-2:] != '.s':
		print 'Error: file is not an assembly file.'
		raise SystemExit(1)


	# Implements Figure 6 from notes
	ast = x86AST(sys.argv[1])
	act = x86Activation("main")

	act.setNumVars(3)

	act.addInstruction(x86Call("input"))
	act.addInstruction(x86Mov("%eax", "-4(%ebp)"))

	act.addInstruction(x86Mov("-4(%ebp)", "%eax"))
	act.addInstruction(x86Mov("%eax", "-8(%ebp)"))
	act.addInstruction(x86Neg("-8(%ebp)"))

	act.addInstruction(x86Mov("-8(%ebp)", "%eax"))
	act.addInstruction(x86Mov("%eax", "-12(%ebp)"))
	act.addInstruction(x86Add("$2", "-12(%ebp)"))

	act.addInstruction(x86Push("-12(%ebp)"))
	act.addInstruction(x86Call("print_int_nl"))
	act.addInstruction(x86Add("$4", "%esp"))

	act.addInstruction(x86Mov("$0", "%eax"))

	ast.addRecord(act)
	ast.prettyPrint()

