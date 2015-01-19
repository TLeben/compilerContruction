#!/usr/bin/python

import ast
import compiler
from compiler.ast import *

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
		return parse_nodes(n.nodes[0])
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
		return parse_nodes(n.left) 
		return parse_nodes(n.right)
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
	if DEBUG >= 1: print "\nGOT ->Module<-"

	module = in_module.node
	if DEBUG >= 2: print str(module)

##----------------------------------------------------------------------------##

def process_stmnt(in_stmnt):
	if DEBUG >= 1: print "\nGOT ->Statement<-"
	if DEBUG >= 2: 
		for stmnt in in_stmnt.nodes:
			print str(stmnt)

##----------------------------------------------------------------------------##

def process_printnl(in_printnl):
	if DEBUG >= 1: print "\nGOT ->Printnl<-"

	# in P0 we only support 1 argument to print
	if len(in_printnl.nodes) > 1:
		raise Exception('Invalid P0:  Too many elements in Printnl!')

	printnl = in_printnl.nodes[0]
	if DEBUG >= 2: print str(printnl)

	out_file.write('Print  ->')
	out_file.write(str(printnl))
	out_file.write('<-\n')

##----------------------------------------------------------------------------##

def process_assign(in_assign):
	if DEBUG >= 1: print "\nGOT ->Assign<-"

	# TODO: Check for OP_ASSIGN flag only for P0
	if DEBUG >= 2: print str(in_assign.expr)

	out_file.write('Assign  ->')
	out_file.write(str(in_assign.expr))
	out_file.write('<-\n')

##----------------------------------------------------------------------------##

def process_assname(in_assname):
	if DEBUG >= 1: print "\nGOT ->AssName<-"
	if DEBUG >= 2: print str(in_assname)

##----------------------------------------------------------------------------##

def process_discard(in_discard):
	if DEBUG >= 1: print "\nGOT ->Discard<-"
	if DEBUG >= 2: print str(in_discard.expr)

##----------------------------------------------------------------------------##

def process_const(in_const):
	if DEBUG >= 1: print "\nGOT ->Const<-"
	if DEBUG >= 2: print str(in_const)

##----------------------------------------------------------------------------##

def process_name(in_name):
	if DEBUG >= 1: print "\nGOT ->Name<-"
	if DEBUG >= 2: print str(in_name)

##----------------------------------------------------------------------------##

def process_add(in_add):
	if DEBUG >= 1: print "\nGOT ->Add<-"
	if DEBUG >= 2:
		print "Left ->"
		print in_add.left
		print "<-"
		print "Right ->"
		print in_add.right
		print "<-"

	out_file.write('Add  left ->')
	out_file.write(n.left)
	out_file.write('<-  right ->')
	out_file.write(n.right)
	out_file.write('<-')

##----------------------------------------------------------------------------##

def process_unarysub(in_unarysub):
	if DEBUG >= 1: print "\nGOT ->UnarySub<-"
	if DEBUG >= 2: print str(in_unarysub.expr)
	
	out_file.write('UnarySub ->')
	out_file.write(n.expr)
	out_file.write('<-\n')

##----------------------------------------------------------------------------##

def process_callfunc(in_callfunc):
	if DEBUG >= 1: print "\nGOT ->CallFunc<-"
	if DEBUG >= 2: print str(in_callfunc.node)

	out_file.write('CallFunc ->')
	out_file.write(n.node)
	out_file.write('<-')

##----------------------------------------------------------------------------##

file_ast =  compiler.parseFile('parse.py')
print
print "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
print file_ast
print "++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
print

#print num_nodes(file_ast)

out_file = open('compile.txt','w')
parse_nodes(file_ast)
out_file.close()

