from flatten2 import *
from pyAST import *


class FlatVisitor(FlatVisitor):
    # def visitAssAttr(self, n, args=None):
    #   implemented in visitAssign
    #     pass

    def visitGetattr(self, n, args=None):
        (expr, stmts) = self.dispatch(n.expr)
        return Name(self.getNextTemp()), stmts + [
            Assign([AssName(self.getCurrTemp(), 'OP_ASSIGN')],
                   Getattr(expr, n.attrname))]

    def visitHasAttr(self, n, args=None):
        (expr, stmts) = self.dispatch(n.expr)
        return Name(self.getNextTemp()), stmts + [
            Assign([AssName(self.getCurrTemp(), 'OP_ASSIGN')],
                   HasAttr(expr, n.attrname))]

    def visitCreateClass(self, n, args=None):

        (base, bList) = self.dispatch(InjectFrom(
            Const(tagof[BIG_t]), List(n.bases)))
        return Name(self.getNextTemp()), bList + [
            Assign([AssName(self.getCurrTemp(), 'OP_ASSIGN')],
                   CreateClass(base))]

    def visitWhile(self, n, args=None):
        (test, tList) = self.dispatch(n.test)
        body = self.dispatch(n.body)
        return [While(Stmt(tList + [test]), body, None)]

    def visitIf(self, n, args=None):
        (test, tList) = self.dispatch(n.tests[0][0])
        print 'visiting if in flatten3'
        if isinstance(test, List):
            print test
        else:
            print 'not a List'
        then = self.dispatch(n.tests[0][1])
        else_ = self.dispatch(n.else_)
        return tList + [If([(test, then)], else_)]

