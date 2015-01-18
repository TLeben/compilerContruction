#!/usr/bin/python

import ast
import compiler
from compiler.ast import *

##----------------------------------------------------------------------------##

def num_nodes(n):
	if isinstance(n, Module):
		return 1 + num_nodes(n.node)
	elif isinstance(n, Stmt):
		return 1 + sum([num_nodes(x) for x in n.nodes])
	elif isinstance(n, Printnl):
		return 1 + num_nodes(n.nodes[0])
	elif isinstance(n, Assign):
		return 1 + num_nodes(n.nodes[0]) + num_nodes(n.expr)
	elif isinstance(n, AssName):
		return 1
	elif isinstance(n, Discard):
		return 1 + num_nodes(n.expr)
	elif isinstance(n, Const):
		return 1
	elif isinstance(n, Name):
		return 1
	elif isinstance(n, Add):
		return 1 + num_nodes(n.left) + num_nodes(n.right)
	elif isinstance(n, UnarySub):
		return 1 + num_nodes(n.expr)
	elif isinstance(n, CallFunc):
		return 1 + num_nodes(n.node)
	else:
		raise Exception('Error in num_nodes: unrecognized AST node')

##----------------------------------------------------------------------------##

def parse_nodes(n):
	if isinstance(n, Module):
		print "---------------------------"
		print "GOT ->Module<-"
		return parse_nodes(n.node)
	elif isinstance(n, Stmt):
		print "---------------------------"
		print "GOT ->Statement<-"
		return [parse_nodes(x) for x in n.nodes]
	elif isinstance(n, Printnl):
		print "---------------------------"
		print "GOT ->Printnl<-"
		out_file.write('Print  ->')
		out_file.write(str(n))
		out_file.write('<-\n')
		return parse_nodes(n.nodes[0])
	elif isinstance(n, Assign):
		print "---------------------------"
		print "GOT ->Assign<-"
		out_file.write('Assign  ->')
		out_file.write(str(n.expr))
		out_file.write('<-\n')
		return parse_nodes(n.nodes[0])
	elif isinstance(n, AssName):
		print "---------------------------"
		print "GOT ->AssName<-"
		return
	elif isinstance(n, Discard):
		print "---------------------------"
		print "GOT ->Discard<-"
		return parse_nodes(n.expr)
	elif isinstance(n, Const):
		print "---------------------------"
		print "GOT ->Const<-"
		return
	elif isinstance(n, Name):
		print "---------------------------"
		print "GOT ->Name<-"
		return
	elif isinstance(n, Add):
		print "---------------------------"
		print "GOT ->Add<-"
		out_file.write('Add  left ->')
		out_file.write(n.left)
		out_file.write('<-  right ->')
		out_file.write(n.right)
		out_file.write('<-')
		return parse_nodes(n.left) 
		return parse_nodes(n.right)
	elif isinstance(n, UnarySub):
		print "---------------------------"
		print "GOT ->UnarySub<-"
		out_file.write('UnarySub ->')
		out_file.write(n.expr)
		out_file.write('<-\n')
		return parse_nodes(n.expr)
	elif isinstance(n, CallFunc):
		print "---------------------------"
		print "GOT ->CallFunc<-"
		out_file.write('CallFunc ->')
		out_file.write(n.node)
		out_file.write('<-')
		return parse_nodes(n.node)
	else:
		raise Exception('Error in num_nodes: unrecognized AST node')

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

