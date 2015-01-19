#!/usr/bin/python

import ast
import compiler
from compiler.ast import *
from compiler.consts import OP_ASSIGN

DEBUG = 2

##----------------------------------------------------------------------------##

def parse_nodes(n):
	if isinstance(n, Module):
		process_module(n)
		return parse_nodes(n.node)
	elif isinstance(n, Stmt):
		process_stmnt(n)
		return [parse_nodes(x) for x in n.nodes]
	elif isinstance(n, Printnl):
		process_printnl(n)
		return parse_nodes(n.nodes[0])
	elif isinstance(n, Assign):
		process_assign(n)
		return [parse_nodes(x) for x in [n.nodes[0], n.expr]]
	elif isinstance(n, AssName):
		process_assname(n)
		return
	elif isinstance(n, Discard):
		process_discard(n)
		return parse_nodes(n.expr)
	elif isinstance(n, Const):
		process_const(n)
		return
	elif isinstance(n, Name):
		process_name(n)
		return
	elif isinstance(n, Add):
		process_add(n)
		return [parse_nodes(x) for x in [n.left, n.right]]
	elif isinstance(n, UnarySub):
		process_unarysub(n)
		return parse_nodes(n.expr)
	elif isinstance(n, CallFunc):
		process_callfunc(n)
		return parse_nodes(n.node)
	else:
		raise Exception('Error in num_nodes: unrecognized AST node')

##----------------------------------------------------------------------------##

def process_module(in_module):
	if DEBUG >= 1: print "\nGOT Module"

	module = in_module.node
	if DEBUG >= 3: print str(module)

##----------------------------------------------------------------------------##

def process_stmnt(in_stmnt):
	if DEBUG >= 1: print "\nGOT Statement"
	if DEBUG >= 2: 
		for stmnt in in_stmnt.nodes:
			print str(stmnt)

##----------------------------------------------------------------------------##

def process_printnl(in_printnl):
	if DEBUG >= 1: print "\nGOT Printnl"

	# in P0 we only support 1 argument to print
	if len(in_printnl.nodes) > 1:
		raise Exception('Invalid P0:  Too many elements in Printnl!')

	printnl = in_printnl.nodes[0]
	if DEBUG >= 2: print str(printnl)

##----------------------------------------------------------------------------##

def process_assign(in_assign):
	if DEBUG >= 1: print "\nGOT Assign"
	if DEBUG >= 2: print str(in_assign)

##----------------------------------------------------------------------------##

def process_assname(in_assname):
	if DEBUG >= 1: print "\nGOT AssName"

	# in P0 we only support OP_ASSIGN
	if in_assname.flags != OP_ASSIGN:
		raise Exception('Invalid P0:  AssName has flags not equal to OP_ASSIGN!')

	if DEBUG >= 2: print str(in_assname)

##----------------------------------------------------------------------------##

def process_discard(in_discard):
	if DEBUG >= 1: print "\nGOT Discard"
	if DEBUG >= 2: print str(in_discard)

##----------------------------------------------------------------------------##

def process_const(in_const):
	if DEBUG >= 1: print "\nGOT Const"
	if DEBUG >= 2: print str(in_const)

##----------------------------------------------------------------------------##

def process_name(in_name):
	if DEBUG >= 1: print "\nGOT Name"
	if DEBUG >= 2: print str(in_name)

##----------------------------------------------------------------------------##

def process_add(in_add):
	if DEBUG >= 1: print "\nGOT Add"
	if DEBUG >= 2:
		print "Left ->", str(in_add.left), "<- Right ->", str(in_add.right), "<-"

##----------------------------------------------------------------------------##

def process_unarysub(in_unarysub):
	if DEBUG >= 1: print "\nGOT UnarySub"
	if DEBUG >= 2: print str(in_unarysub)
	
##----------------------------------------------------------------------------##

def process_callfunc(in_callfunc):
	if DEBUG >= 1: print "\nGOT CallFunc"
	if DEBUG >= 2: print str(in_callfunc)

##----------------------------------------------------------------------------##

file_ast =  compiler.parseFile('parse.py')
print
print "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
print file_ast
print "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
print

#out_file = open('compile.txt','w')
parse_nodes(file_ast)
#out_file.close()

