#!/usr/bin/env python

from ASTourist import ASTourist
from ASTourist import ASTVisitor
from RegisterAllocator import *

import sys
import compiler
from subprocess import call

# Homework 2
# sys.path.append('hw2')
# sys.path.append('hw2/ply-3.4')
# from parse import Parser

DEBUG = 2

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print 'Usage: %s <pythonFile.py>' % (sys.argv[0])
        raise SystemExit(1)

    if sys.argv[1][-3:] != '.py':
        print 'Error: file is not a python file.'
        raise SystemExit(1)

    inFile = sys.argv[1]
    outFile = inFile[:-3] + ".s"

    #
    # setup the test environment
    #

    # remove previous assembly files
    command = 'rm -f {}'.format(outFile)
    call(command.split(), shell=False)

    #
    # create the x86 assembly
    #
    try:
        tree = compiler.parseFile(inFile)

        # Homework 2
        # tree = Parser().parse(inFile)

    except IOError as e:
        print 'Unable to open %s: %s' % (inFile, e)
    else:
        # walk the Abstract Syntax Tree
        visitor = ASTourist(outFile, debug=DEBUG)
        compiler.walk(tree, visitor, walker=ASTVisitor())
        visitor.breadth()

        # x86 instruction selection
        # visitor.toInterCode()
        visitor.flatten()
        if DEBUG >= 1:
            print "------------------------------------------"
            visitor.renderAssembly(stdout=True)
            print "------------------------------------------"

        # register allocation
        allocator = RegisterAllocator(visitor, debug=DEBUG)
        allocator.allocateRegisters()

        # generate final x86 assembly
        if DEBUG >= 1:
            print "------------------------------------------"
            visitor.renderAssembly(stdout=True)
            print "------------------------------------------"
        else:
            visitor.renderAssembly(stdout=False)

