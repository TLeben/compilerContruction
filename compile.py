#!/usr/bin/env python
import sys
import compiler
from declassify3 import *
from explicate3 import *
from uniquify3 import *
from heapify3 import *
from closure3 import *
from flatten3 import *
from selector3 import *
from RegisterAllocator import *
from unstructorFlow import *

import sys
import compiler
from subprocess import call

# Homework 2
# sys.path.append('hw2')
# sys.path.append('hw2/ply-3.4')
# from parse import Parser

debug = 0

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print 'Usage: %s <pythonFile.py>' % (sys.argv[0])
        raise SystemExit(1)

    if sys.argv[1][-3:] != '.py':
        print 'Error: file is not a python file.'
        raise SystemExit(1)
    if len(sys.argv) == 3:
        debug = int (sys.argv[2])
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
        toDeclassify = compiler.parseFile(inFile)

        # Homework 2
        # tree = Parser().parse(inFile)



    except IOError as e:
        print 'Unable to open %s: %s' % (inFile, e)
    else:
        #toDeclassify = compiler.parseFile(inFile)

        toUnique = DeclassifyVisitor().doPass(toDeclassify, debug)

        toExplicate = UniquifyVisitor().doPass(toUnique, debug)

        toHeapify = ExplicateVisitor().doPass(toExplicate, debug)

        toClosure = HeapifyVisitor().doPass(toHeapify, debug)

        toFlatten = ClosureVisitor().doPass(toClosure, debug)

        toSelector = FlatVisitor().doPass(toFlatten, debug)

        toRegAlloc = x86Selector().doPass(toSelector, debug)

        toRemoveFlow, env = RegisterAllocator().allocateRegisters(toRegAlloc,
                                                                  debug)

        # x86Code = x86Selector().replaceVars(env, toRemoveFlow)
        x86Code = FlowStripper().doPass(toRemoveFlow, debug)
        x86Code = x86Selector().replaceVars(env, x86Code)
        #x86Code = x86Selector().replaceVars(env, toRenameVars)


        stdout = sys.stdout
        sys.stdout = open(outFile, 'w')
        x86Selector().prettyPrint(x86Code, 0)
        sys.stdout.close()
        sys.stdout = stdout




