#!/usr/bin/python

import compiler
from compiler.visitor import walk
from compiler.visitor import ASTVisitor
from collections import deque


class NotImplementedException(Exception):

    '''
    NotImplementedException is raised to handle AST nodes
    not yet implemented in the language.
    '''
    pass


class ASTourist(object):

    '''
    ASTourist() is a visitor object that handles all ast.Node types.
    The visit function is dynamically selected based on the name of the class.
    All ast.Nodes are included but if an ast.Node type is not implemented it
    throws an error.
    Usage is compiler.walk(tree, ASTourist(), walker=ASTVisitor() )
    This class can be imported or run as a standalone program
    '''

    def __init__(self, ofile):
        self.stk = deque()
        self.o = ofile

    def genericVisit(self, node):
        print type(node).__name__

    def visit(self, node):
        print type(node).__name__

    def visitAdd(self, node):
        # Add attributes
        # left             left operand
        #     right            right operand
        self.stk.append(node.left)
        self.stk.append(node.right)
        print '+'

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
        print node.flags
        print node.name

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
        print 'callFunc'
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
        print node.value
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
        self.stk.append(node.expr)
        # raise NotImplementedException('visitDiscard')

    def visitDiv(self, node):
        # Div attributes
        # left
        #     right
        raise NotImplementedException('visitDiv')
        self.stk.append(node.left)
        self.stk.append(node.right)
        print '/'

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
        print '*'

    def visitName(self, node):
        # Name attributes
        # name
        print node.name
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
            print n
            # self.stk.appendleft('printnl')
            # walk(n, self)
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
            print n
            self.stk.append(n)
        # raise NotImplementedException('visitStmt')

    def visitSub(self, node):
        # Sub attributes
        # left
        #     right
        raise NotImplementedException('visitSub')
        self.stk.append(node.left)
        self.stk.append(node.right)
        print '-'

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
        print '(-)'
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
            walk(n, self)

if __name__ == "__main__":
    import sys

    pyfi = 'p2.py'
    ofile = 'tst.py'
    if len(sys.argv) > 1:
        pyfi = sys.argv[1]
    tree = compiler.parseFile(pyfi)
    visitor = ASTourist(ofile)

    compiler.walk(tree, visitor, walker=ASTVisitor())
    visitor.breadth()
