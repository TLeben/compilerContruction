#!/usr/bin/env python

'''
@TODO:  Replace registers in toInterCode with placeholders
'''

import compiler
from compiler.visitor import walk
from compiler.visitor import ASTVisitor
from collections import deque
from x86AST import *


class NotImplementedException(Exception):

    '''
    NotImplementedException is raised to handle AST nodes
    not yet implemented in the language.
    '''
    pass


class Quad(object):

    '''Provides mutable data struct implementing three-address
    instruction using Quadruples.
    '''

    def __init__(self, result=None, op=None, arg1=None, arg2=None):
        self.op = op
        self.arg1 = arg1
        self.arg2 = arg2
        self.result = result

    def toString(self):
        # if self.arg2 is None:
        if self.op == 'callFunc':
            return '{0} = {1}()'.format(self.result, self.arg1)
        elif self.op == 'OP_ASSIGN':
            return '{0} = {1}'.format(self.result, self.arg1)
        elif self.op == 'printnl':  # printnl
            return 'print {}'.format(self.arg1)
        elif self.op == '(-)':
            return '{0} = - {1}'.format(self.result, self.arg1)
        return "{0} = {1} {2} {3}".format(self.result, self.arg1, self.op, self.arg2)


class ASTourist(object):

    '''
    ASTourist() is a visitor object that handles all ast.Node types.
    The visit function is dynamically selected based on the name of the class.
    All ast.Nodes are included but if an ast.Node type is not implemented it
    throws an error.
    Usage is compiler.walk(tree, ASTourist(), walker=ASTVisitor() )
    This class can be imported or run as a standalone program
    '''

    def __init__(self, outFile, debug=0):
        self.outFile = outFile
        self.debug = debug
        self.stk = deque()
        self.stk.append('mkr')  # marks end of deque
        self.x86ast = x86AST()
        self.tmpCounter = 0
        self.regCounter = 0

    def getNextTemp(self):
        tmp = "___z" + str(self.tmpCounter)
        self.tmpCounter += 1
        return tmp

    def getNextRegTemp(self):
        ## old code ##
#        tmp = '-' + str((self.regCounter + 1) * 4) + "(%ebp)"
        ## new code ##
        tmp = "___y" + str(self.regCounter)

        self.regCounter += 1
        return tmp

    def genericVisit(self, node):
        if self.debug >= 1:
            print type(node).__name__

    def visit(self, node):
        if self.debug >= 1:
            print type(node).__name__

    def visitAdd(self, node):
        # Add attributes
        # left             left operand
        #     right            right operand
        self.stk.append(node.left)
        self.stk.append(node.right)
        self.stk.appendleft('+')
        # print '+'

    def visitAnd(self, node):
        # And attributes
        # nodes            list of operands
        raise NotImplementedException('visitAnd')

    def visitAssAttr(self, node):
        # AssAttr attributes
        # expr             expression on the left-hand side of the dot
        #     attrname         the attribute name, a string
        #     flags            XXX
        raise NotImplementedException('visitAssAttr')

    def visitAssList(self, node):
        # AssList attributes
        # nodes            list of list elements being assigned to
        raise NotImplementedException('visitAssList')

    def visitAssName(self, node):
        # AssName attributes
        # name             name being assigned to
        #     flags            XXX
        self.stk.appendleft(node.flags)
        self.stk.appendleft(node.name)
        # print node.flags
        # print node.name

    def visitAssTuple(self, node):
        # AssTuple attributes
        # nodes            list of tuple elements being assigned to
        raise NotImplementedException('visitAssTuple')

    def visitAssert(self, node):
        # Assert attributes
        # test             the expression to be tested
        # fail             the value of the <tt
        # class="exception">AssertionError</tt>
        raise NotImplementedException('visitAssert')

    def visitAssign(self, node):
        # Assign attributes
        # nodes            a list of assignment targets, one per equal sign
        #     expr             the value being assigned
        self.stk.append(node.expr)
        self.stk.append(node.nodes[0])
        # raise NotImplementedException('visitAssign')

    def visitAugAssign(self, node):
        # AugAssign attributes
        # node
        #     op
        #     expr
        raise NotImplementedException('visitAugAssign')

    def visitBackquote(self, node):
        # Backquote attributes
        # expr
        raise NotImplementedException('visitBackquote')

    def visitBitand(self, node):
        # Bitand attributes
        # nodes
        raise NotImplementedException('visitBitand')

    def visitBitor(self, node):
        # Bitor attributes
        # nodes
        raise NotImplementedException('visitBitor')

    def visitBitxor(self, node):
        # Bitxor attributes
        # nodes
        raise NotImplementedException('visitBitxor')

    def visitBreak(self, node):
        # Break attributes

        raise NotImplementedException('visitBreak')

    def visitCallFunc(self, node):
        # CallFunc attributes
        # node             expression for the callee
        #     args             a list of arguments
        #     star_args        the extended *-arg value
        #     dstar_args       the extended **-arg value
        # print 'callFunc'
        self.stk.appendleft('callFunc')
        self.stk.append(node.node)
        # raise NotImplementedException('visitCallFunc')

    def visitClass(self, node):
        # Class attributes
        # name             the name of the class, a string
        #     bases            a list of base classes
        #     doc              doc string, a string or <code>None</code>
        #     code             the body of the class statement
        raise NotImplementedException('visitClass')

    def visitCompare(self, node):
        # Compare attributes
        # expr
        #     ops
        raise NotImplementedException('visitCompare')

    def visitConst(self, node):
        # Const attributes
        # value
        # print 'const(', node.value, ')'
        self.stk.appendleft(node.value)
        # print node.value
        # raise NotImplementedException('visitConst')

    def visitContinue(self, node):
        # Continue attributes

        raise NotImplementedException('visitContinue')

    def visitDict(self, node):
        # Dict attributes
        # items
        raise NotImplementedException('visitDict')

    def visitDiscard(self, node):
        # Discard attributes
        # expr
        # print 'discard'
        self.stk.appendleft('discard')
        self.stk.append(node.expr)
        # raise NotImplementedException('visitDiscard')

    def visitDiv(self, node):
        # Div attributes
        # left
        #     right
        raise NotImplementedException('visitDiv')
        self.stk.append(node.left)
        self.stk.append(node.right)
        # print '/'

    def visitEllipsis(self, node):
        # Ellipsis attributes

        raise NotImplementedException('visitEllipsis')

    def visitExec(self, node):
        # Exec attributes
        # expr
        #     locals
        #     globals
        raise NotImplementedException('visitExec')

    def visitFor(self, node):
        # For attributes
        # assign
        #     list
        #     body
        #     else_
        raise NotImplementedException('visitFor')

    def visitFrom(self, node):
        # From attributes
        # modname
        #     names
        raise NotImplementedException('visitFrom')

    def visitFunction(self, node):
        # Function attributes
        # name             name used in def, a string
        #     argnames         list of argument names, as strings
        #     defaults         list of default values
        #     flags            xxx
        #     doc              doc string, a string or <code>None</code>
        #     code             the body of the function
        raise NotImplementedException('visitFunction')

    def visitGetattr(self, node):
        # Getattr attributes
        # expr
        #     attrname
        raise NotImplementedException('visitGetattr')

    def visitGlobal(self, node):
        # Global attributes
        # names
        raise NotImplementedException('visitGlobal')

    def visitIf(self, node):
        # If attributes
        # tests
        #     else_
        raise NotImplementedException('visitIf')

    def visitImport(self, node):
        # Import attributes
        # names
        raise NotImplementedException('visitImport')

    def visitInvert(self, node):
        # Invert attributes
        # expr
        raise NotImplementedException('visitInvert')

    def visitKeyword(self, node):
        # Keyword attributes
        # name
        #     expr
        raise NotImplementedException('visitKeyword')

    def visitLambda(self, node):
        # Lambda attributes
        # argnames
        #     defaults
        #     flags
        #     code
        raise NotImplementedException('visitLambda')

    def visitLeftShift(self, node):
        # LeftShift attributes
        # left
        #     right
        raise NotImplementedException('visitLeftShift')

    def visitList(self, node):
        # List attributes
        # nodes
        raise NotImplementedException('visitList')

    def visitListComp(self, node):
        # ListComp attributes
        # expr
        #     quals
        raise NotImplementedException('visitListComp')

    def visitListCompFor(self, node):
        # ListCompFor attributes
        # assign
        #     list
        #     ifs
        raise NotImplementedException('visitListCompFor')

    def visitListCompIf(self, node):
        # ListCompIf attributes
        # test
        raise NotImplementedException('visitListCompIf')

    def visitMod(self, node):
        # Mod attributes
        # left
        #     right
        raise NotImplementedException('visitMod')

    def visitModule(self, node):
        # Module attributes
        # doc              doc string, a string or <code>None</code>
        # node             body of the module, a <tt class="class">Stmt</tt>
        self.stk.append(node.node)
        # raise NotImplementedException('visitModule')

    def visitMul(self, node):
        # Mul attributes
        # left
        #     right
        raise NotImplementedException('visitMul')
        self.stk.append(node.left)
        self.stk.append(node.right)
        # print '*'

    def visitName(self, node):
        # Name attributes
        # name
        # print node.name
        self.stk.appendleft(node.name)
        # raise NotImplementedException('visitName')

    def visitNot(self, node):
        # Not attributes
        # expr
        raise NotImplementedException('visitNot')

    def visitOr(self, node):
        # Or attributes
        # nodes
        raise NotImplementedException('visitOr')

    def visitPass(self, node):
        # Pass attributes

        raise NotImplementedException('visitPass')

    def visitPower(self, node):
        # Power attributes
        # left
        #     right
        raise NotImplementedException('visitPower')

    def visitPrint(self, node):
        # Print attributes
        # nodes
        #     dest
        raise NotImplementedException('visitPrint')

    def visitPrintnl(self, node):
        # Printnl attributes
        # nodes
        #     dest
        for n in node.nodes:
            # print 'printnl'
            self.stk.appendleft('printnl')
            self.stk.append(n)
        # raise NotImplementedException('visitPrintnl')

    def visitRaise(self, node):
        # Raise attributes
        # expr1
        #     expr2
        #     expr3
        raise NotImplementedException('visitRaise')

    def visitReturn(self, node):
        # Return attributes
        # value
        raise NotImplementedException('visitReturn')

    def visitRightShift(self, node):
        # RightShift attributes
        # left
        #     right
        raise NotImplementedException('visitRightShift')

    def visitSlice(self, node):
        # Slice attributes
        # expr
        #     flags
        #     lower
        #     upper
        raise NotImplementedException('visitSlice')

    def visitSliceobj(self, node):
        # Sliceobj attributes
        # nodes            list of statements
        raise NotImplementedException('visitSliceobj')

    def visitStmt(self, node):
        # Stmt attributes
        # nodes
        for n in node.nodes:
            # print n
            self.stk.append(n)
        # raise NotImplementedException('visitStmt')

    def visitSub(self, node):
        # Sub attributes
        # left
        #     right
        raise NotImplementedException('visitSub')
        self.stk.append(node.left)
        self.stk.append(node.right)
        # print '-'
        self.stk.appendleft('-')

    def visitSubscript(self, node):
        # Subscript attributes
        # expr
        #     flags
        #     subs
        raise NotImplementedException('visitSubscript')

    def visitTryExcept(self, node):
        # TryExcept attributes
        # body
        #     handlers
        #     else_
        raise NotImplementedException('visitTryExcept')

    def visitTryFinally(self, node):
        # TryFinally attributes
        # body
        #     final
        raise NotImplementedException('visitTryFinally')

    def visitTuple(self, node):
        # Tuple attributes
        # nodes
        raise NotImplementedException('visitTuple')

    def visitUnaryAdd(self, node):
        # UnaryAdd attributes
        # expr
        raise NotImplementedException('visitUnaryAdd')
        self.stk.append(node.expr)

    def visitUnarySub(self, node):
        # UnarySub attributes
        # expr
        # print '(-)'
        self.stk.appendleft('(-)')
        self.stk.append(node.expr)
        # raise NotImplementedException('visitUnarySub')

    def visitWhile(self, node):
        # While attributes
        # test
        #     body
        #     else_
        raise NotImplementedException('visitWhile')

    def visitYield(self, node):
        # Yield attributes
        # value
        raise NotImplementedException('visitYield')

    def breadth(self):
        while self.stk:
            n = self.stk.pop()
            try:
                # dumps the marker ir error is raised
                walk(n, self)
            except AttributeError:
                break

    def flatten(self):
        pyIR = deque()
        if self.debug >= 1:
            print self.stk
        act = x86Activation("main")
        varCount = 0
        symTable = dict()
        tmp = '___t'
        while self.stk:
            t = self.stk[0]
            quad = Quad()
            # ----------------Termination statements *reset temp vars----------- #
            if t == 'discard':
                # no need to instatiate a new quad
                # bc it is discarded
                quad.op = self.stk.popleft()
                quad.arg1 = self.stk.pop()
                if self.debug >= 1:
                    print quad.toString()
                pyIR.append(quad)
                # varCount = 0  # temp vars no longer needed so we reset to t0
            elif t == 'OP_ASSIGN':  # assignment operator
                quad.op = self.stk.popleft()
                quad.result = self.stk.pop()
                quad.arg1 = self.stk.pop()
                if self.debug >= 1:
                    print quad.toString()
                symTable[quad.result] = self.getNextRegTemp()
          
                # varCount = 0  # temp vars no longer needed so we reset to t0
                pyIR.append(quad)
                varCount += 1
            elif t == 'printnl':
                quad.op = self.stk.popleft()
                quad.arg1 = self.stk.pop()
                if self.debug >= 1:
                    print quad.toString()
                pyIR.append(quad)
                # varCount = 0  # temp vars no longer needed so we reset to t0

            # ------Function call arg1 = function name arg2 = [,params]--- #
            elif t == 'callFunc':
                quad.op = self.stk.popleft()
                quad.arg1 = self.stk.pop()
                quad.result = self.getNextTemp()
                self.stk.appendleft(quad.result)
                if self.debug >= 1:
                    print quad.toString()
                varCount += 1
                pyIR.append(quad)
            # ------------Binary operations (+, -, *, /)------------------#
            elif t == '+':
                qd2 = Quad()
                qd2.op = 'OP_ASSIGN'
                quad.op = self.stk.popleft()
                quad.arg2 = self.stk.pop()
                quad.arg1 = self.stk.pop()
                quad.result = self.getNextTemp()
                if self.debug >= 1:
                    print quad.toString()
                symTable[quad.result] = self.getNextRegTemp()
                self.stk.appendleft(quad.result)
                #
                qd2.arg1 = quad.arg2
                qd2.result = quad.result
                quad.arg2 = qd2.result
                varCount += 1
                pyIR.append(qd2)
                pyIR.append(quad)

            # ---------------Unary operations (pos, neg, ....)-------------#
            elif t == '(-)':
                quad.op = self.stk.popleft()
                quad.arg1 = self.stk.pop()
                quad.result = self.getNextTemp()
                if self.debug >= 1:
                    print quad.toString()
                symTable[quad.result] = self.getNextRegTemp()
                self.stk.appendleft(quad.result)

                varCount += 1
                pyIR.append(quad)
            else:
                self.stk.rotate(-1)

        if self.debug >= 1:
            print 'symTable:\n',symTable
            for q in pyIR:
                print q.toString()
        self.toPythonIR(pyIR)
    
    def toPythonIR(self, q):
        # for qd in q:
        #     print qd.toString()
        # q.appendleft('mrk')
        # e = q.pop()
        # while e != 'mrk':
        #     if 'OP_ASSIGN' == e.op and str(e.arg1).startswith('_'):
        #         '''
        #         We can simplify
        #         '''
        #         e2 = q.pop()
        #         while e.arg1 == e2.result:
                    
        #             if e2.op == 'OP_ASSIGN':
        #                 # we can replace left side
        #                 e2.result = e.result
        #                 q.appendleft(e2)
        #                 e2 = q.pop()
        #             elif e2.op == '+':
        #                 # replace left and arg2
        #                 e2.result = e.result
        #                 e2.arg2   = e.result
        #                 q.appendleft(e2)
        #                 e2 = q.pop()
        #             elif e2.op == '(-)':
        #                 q.appendleft(e2)
        #                 e2 = q.pop()
        #             q.appendleft(e2)

        #         q.append(e2)
                    
        #     else:
        #         q.appendleft(e)
        #     e = q.pop()

        self.x86IR(q)
        # for qd in q:
        #     print qd.toString()

    def x86IR(self, q):
        act = x86Activation("main")

        while q:
            py = q.popleft()

            if py.op == 'discard':
                pass

            elif py.op == 'OP_ASSIGN':
                if isinstance(py.arg1, int):
                    src = '$' + str(py.arg1)
                else:
                    src = py.arg1
                act.addInstruction(x86Mov(src, py.result))
            
            elif py.op == 'printnl':
                if isinstance(py.arg1, int):
                    src = '$' + str(py.arg1)
                else:
                    src = py.arg1
                act.addInstruction(x86Push(src))
                # call print_int_nl
                act.addInstruction(x86Call("print_int_nl"))

            elif py.op == 'callFunc':
                act.addInstruction(x86Call(py.arg1))
                # movl %eax, -X(%ebp)
                act.addInstruction(x86Mov('%eax', py.result))
            elif py.op == '+':
                if isinstance(py.arg1, int):
                    src = '$' + str(py.arg1)
                else:
                    src = py.arg1
                act.addInstruction(x86Add(src, py.result))
            elif py.op == '(-)':
                if isinstance(py.arg1, int):
                    src = '$' + str(py.arg1)
                else:
                    src = py.arg1
                act.addInstruction(x86Mov(src, py.result))
                act.addInstruction(x86Neg(py.result))
            
        act.setNumVars(0) #for spill code
        self.x86ast.addRecord(act)





    def toInterCode(self):
        if self.debug >= 1:
            print self.stk
        act = x86Activation("main")
        varCount = 0
        symTable = dict()
        tmp = '___t'
        while self.stk:
            t = self.stk[0]
            quad = Quad()
            # ----------------Termination statements *reset temp vars----------- #
            if t == 'discard':
                # no need to instatiate a new quad
                # bc it is discarded
                quad.op = self.stk.popleft()
                quad.arg1 = self.stk.pop()
                if self.debug >= 1:
                    print quad.toString()
                # varCount = 0  # temp vars no longer needed so we reset to t0
            elif t == 'OP_ASSIGN':  # assignment operator
                quad.op = self.stk.popleft()
                quad.result = self.stk.pop()
                quad.arg1 = self.stk.pop()
                if self.debug >= 1:
                    print quad.toString()
                symTable[quad.result] = self.getNextRegTemp()
                # start to x86 instruction
                if quad.arg1 in symTable:
                    src = symTable[quad.arg1]
                    act.addInstruction(x86Mov(src, '%eax'))
                    act.addInstruction(x86Mov('%eax', symTable[quad.result]))
                else:
                    src = '$' + str(quad.arg1)
                    act.addInstruction(x86Mov(src, symTable[quad.result]))
                # end to x86
                # varCount = 0  # temp vars no longer needed so we reset to t0
                varCount += 1
            elif t == 'printnl':
                quad.op = self.stk.popleft()
                quad.arg1 = self.stk.pop()
                if self.debug >= 1:
                    print quad.toString()
                # start to x86 instruction
                # TODO move this to a meta-instruction in x86AST.py
                if quad.arg1 in symTable:
                    reg = symTable[quad.arg1]
                else:
                    reg = None

                # ---- begin meta print ---- #
                # Push arg we want to print to the stack
                if reg is None:
                    # push an integer ie pushl $42
                    act.addInstruction(x86Push("$" + str(quad.arg1)))
                else:
                    # push a mem-location to the stack, ie pushl -12(%ebp)
                    act.addInstruction(x86Push(reg))

                # call print_int_nl
                act.addInstruction(x86Call("print_int_nl"))
                # pop the stack 
                ############################REMOVE Redundent
                act.addInstruction(x86Add("$4", "%esp"))
                # ---- end meta print ---- #

                # end to x86
                # varCount = 0  # temp vars no longer needed so we reset to t0

            # ------Function call arg1 = function name arg2 = [,params]--- #
            elif t == 'callFunc':
                quad.op = self.stk.popleft()
                quad.arg1 = self.stk.pop()
                quad.result = self.getNextTemp()
                self.stk.appendleft(quad.result)
                if self.debug >= 1:
                    print quad.toString()
                # start to x86 instruction
                # TODO move this to a meta-instruction in x86AST.py
                # call <function name>
                act.addInstruction(x86Call(quad.arg1))
                # movl %eax, -X(%ebp)
                symTable[quad.result] = self.getNextRegTemp()
                act.addInstruction(x86Mov('%eax', symTable[quad.result]))
                # end to x86
                varCount += 1

            # ------------Binary operations (+, -, *, /)------------------#
            elif t == '+':
                quad.op = self.stk.popleft()
                quad.arg2 = self.stk.pop()
                quad.arg1 = self.stk.pop()
                quad.result = self.getNextTemp()
                if self.debug >= 1:
                    print quad.toString()
                symTable[quad.result] = self.getNextRegTemp()
                self.stk.appendleft(quad.result)
                # start to x86 instruction
                # TODO move this to a meta-instruction in x86AST.py
                if quad.arg1 in symTable:
                    src = symTable[quad.arg1]
                    act.addInstruction(x86Mov(src, '%eax'))
                    act.addInstruction(x86Mov('%eax', symTable[quad.result]))
                else:
                    src = '$' + str(quad.arg1)
                    act.addInstruction(x86Mov(src, symTable[quad.result]))
                if quad.arg2 in symTable:
                    src = symTable[quad.arg2]
                    act.addInstruction(x86Mov(src, '%eax'))
                    act.addInstruction(x86Add('%eax', symTable[quad.result]))
                else:
                    src = '$' + str(quad.arg2)
                    act.addInstruction(x86Add(src, symTable[quad.result]))
                # end to x86
                varCount += 1

            # ---------------Unary operations (pos, neg, ....)-------------#
            elif t == '(-)':
                quad.op = self.stk.popleft()
                quad.arg1 = self.stk.pop()
                quad.result = self.getNextTemp()
                if self.debug >= 1:
                    print quad.toString()
                symTable[quad.result] = self.getNextRegTemp()
                self.stk.appendleft(quad.result)

                # start to x86 instruction
                # TODO move this to a meta-instruction in x86AST.py
                # if true we load mem location else we toss a number into eax
                if quad.arg1 in symTable:
                    src = symTable[quad.arg1]
                    act.addInstruction(x86Mov(src, '%eax'))
                    act.addInstruction(x86Mov('%eax', symTable[quad.result]))
                else:
                    src = '$' + str(quad.arg1)
                    act.addInstruction(x86Mov(src, symTable[quad.result]))
                # finally we add: negl -X(%ebp)
                act.addInstruction(x86Neg(symTable[quad.result]))
                # end to x86'''
                varCount += 1
            else:
                self.stk.rotate(-1)

        act.setNumVars(varCount)
        self.x86ast.addRecord(act)
        
        if self.debug >= 1:
            print 'symTable:\n',symTable

    def renderAssembly(self, stdout=False):
        fd = None

        if stdout == False:
            fd = open(self.outFile, "w")
        else:
            fd = sys.stdout

        self.x86ast.prettyPrint(fd)

        if stdout == False:
            fd.close()

if __name__ == "__main__":
    import sys

    pyfi = 'p2.py'
    if len(sys.argv) != 2:
        print 'Usage: %s <pythonFile.py>' % (sys.argv[0])
        raise SystemExit(1)
    if sys.argv[1][-3:] != '.py':
        print 'Error: file is not a python file.'
        raise SystemExit(1)
    try:
        tree = compiler.parseFile(sys.argv[1])
        visitor = ASTourist(outFile, debug=0)
        compiler.walk(tree, visitor, walker=ASTVisitor())
        visitor.breadth()
        visitor.flatten()
    except IOError as e:
        print 'Unable to open %s: %s' % (sys.argv[1], e)
    except:
        pass
