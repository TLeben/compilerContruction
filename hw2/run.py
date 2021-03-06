#!/usr/bin/env python

from parse import Parser
import sys
import compiler

inFile = sys.argv[1]

py_tree = compiler.parseFile(inFile)
print "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
print py_tree
print "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

parser = Parser()
my_tree = parser.parse(inFile)
print "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
print my_tree
print "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

# Compare our AST with Python's built in AST
print 'op-check: ', str(py_tree) == str(my_tree)