#!/usr/bin/env python

from ASTourist import ASTourist
from ASTourist import ASTVisitor
import sys
import compiler
from subprocess import call

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
    except IOError as e:
        print 'Unable to open %s: %s' % (inFile, e)
    else:
        visitor = ASTourist(outFile)
        compiler.walk(tree, visitor, walker=ASTVisitor())
        visitor.breadth()
        visitor.toInterCode()
        visitor.renderAssembly()

