from pyAST import *
from tourist import Visitor

todo = 0


class NotImplementedException(Exception):
    '''
    NotImplementedException is raised to handle AST nodes
    not yet implemented in the language.
    '''
    pass


class FlatVisitor(Visitor):
    _tmpCounter = 0


    def __init__(self):
        super(FlatVisitor, self).__init__()

    # Helper methods----------------------------------

    def getNextTemp(self):
        self._tmpCounter += 1
        tmp = "___flt" + str(self._tmpCounter)
        return tmp

    def getCurrTemp(self):
        tmp = "___flt" + str(self._tmpCounter)
        return tmp

    # FlatVisitor Methods-----------------------------
    # Program ::= Stmts
    def visitModule(self, n, args=None):
        # Module attributes
        # doc              doc string, a string or None
        # node             body of the module
        return Module(n.doc, self.dispatch(n.node))

    # Stmts ::= Stmt Stmts | e
    def visitStmt(self, n, args=None):
        # Stmt attributes
        # nodes
        stmtList = []
        for child in n.nodes:
            stmtList += self.dispatch(child)

        return Stmt(stmtList)

    # Stmt :== atomic OP_ASSIGN expr | print expr | expr | e--------------------
    #
    def visitAssign(self, n, args=None):
        # Assign attributes
        # nodes            a list of assignment targets, one per equal sign
        # expr             the value being assigned
        # left = expr
        (left, lsList) = self.dispatch(n.nodes[0])
        (expr, rsList) = self.dispatch(n.expr)
        return rsList + [Assign([AssName(left, 'OP_ASSIGN')], expr)]

    def visitDiscard(self, n, args=None):
        # Discard attributes
        # expr  [1]
        # discard (expr)
        return self.dispatch(n.expr)[1]  # [0] is None

    def visitPrintnl(self, n, args=None):
        # Printnl attributes
        # nodes
        # dest
        (expr, sList) = self.dispatch(n.nodes[0])
        return sList + [Printnl([expr], None)]

    # expr:== atomic binOp (expr|atomic) | unaryOp (expr|atomic) | CallFunc(...)

    def visitCallFunc(self, n, args=None):
        # CallFunc attributes
        # node             expression for the callee
        # args             a list of arguments
        # star_args        the extended *-arg value
        # dstar_args       the extended **-arg value
        tmp = self.getNextTemp()
        return Name(tmp), [Assign([AssName(tmp, 'OP_ASSIGN')], n)]

    def visitIfExp(self, n, args=None):
        (test, tstList) = self.dispatch(n.test)
        (then, thnList) = self.dispatch(n.then)
        (else_, elsList) = self.dispatch(n.else_)
        tmp = self.getNextTemp()
        return Name(tmp), tstList + [
            If([(test, Stmt(thnList +
                            [Assign([AssName(tmp, 'OP_ASSIGN')], then)]))],
               Stmt(elsList + [Assign([AssName(tmp, 'OP_ASSIGN')], else_)]))]

    # binOp::= (+)----------------------
    def visitAdd(self, n, args=None):
        # And attributes
        # left             left operand
        # right            right operand
        if todo:
            print "#########visitAdd need to return Let(...) and also explicate"
        (right, lsList) = self.dispatch(n.right)
        (left, rsList) = self.dispatch(n.left)

        nNode = Add((left, right))
        tmp1 = self.getNextTemp()
        return Name(tmp1), lsList + rsList + \
               [Assign([AssName(tmp1, 'OP_ASSIGN')], nNode)]


    # unaryOp::= (-) -----------------------

    def visitUnarySub(self, node, args=None):
        # UnarySub attributes
        # expr
        # print '(-)'
        (expr, sList) = self.dispatch(node.expr)
        tmp = self.getNextTemp()
        return Name(tmp), sList + \
               [Assign([AssName(tmp, 'OP_ASSIGN')], UnarySub(expr))]

    # leaves/atomics ::= variable(name) | Const(int)----------------------------

    def visitAssName(self, n, args=None):
        # AssName attributes
        # name             name being assigned to
        # flags            XXX
        return n, []

    def visitConst(self, n, args=None):
        # Const attributes
        # value

        return n, []

    def visitName(self, n, args=None):
        # Name attributes
        # name
        return Name(n.name), []

if __name__ == '__main__':
    import sys
    import compiler

    pyfi = 'x = 4 if True else False'

    if len(sys.argv) != 2:
        print 'Usage: %s <pythonFile.py>' % (sys.argv[0])
        tree = compiler.parse(pyfi)
    elif sys.argv[1][-3:] != '.py':
        print 'Error: file is not a python file.'
        raise SystemExit(1)
    else:
        try:
            tree = compiler.parseFile(sys.argv[1])
            outFile = sys.argv[1][:-3] + ".s"
            visitor = FlatVisitor()
            visitor.preorder(tree, visitor)

        except IOError as e:
            print 'Unable to open %s: %s' % (sys.argv[1], e)
        except:
            pass
    visitor = FlatVisitor()
    print visitor.preorder(tree, visitor)
    print tree


