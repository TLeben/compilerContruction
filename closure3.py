from closure2 import *
from pyAST import *


class ClosureVisitor(ClosureVisitor):

    def visitAssAttr(self, n, args=None):
        (expr, funcs) = self.dispatch(n.expr)
        return AssAttr(expr, n.attrname, n.flags), funcs

    def visitGetattr(self, n, args=None):
        (expr, funcs) = self.dispatch(n.expr)
        return Getattr(expr, n.attrname), funcs

    def visitHasAttr(self, n, args=None):
        (expr, funcs) = self.dispatch(n.expr)
        return HasAttr(expr, n.attrname), funcs

    def visitCreateClass(self, n, args=None):
        bodyBases = []
        funcsBases = []
        for b in n.bases:
            (bases, funcs) = self.dispatch(b)
            bodyBases.append(bases)
            funcsBases += funcs
        return CreateClass(bodyBases), funcsBases

    def visitWhile(self, n, args=None):
        (test, funcsTest) = self.dispatch(n.test)
        (body, funcsBody) = self.dispatch(n.body)
        return While(test, body,None), funcsTest + funcsBody

    def visitIf(self, n, args=None):
        (test, funcsTest) = self.dispatch(n.tests[0][0])
        (then, funcsThen) = self.dispatch(n.tests[0][1])
        (else_, funcsElse_) = self.dispatch(n.else_)
        return If([(test, then)], else_), funcsTest + funcsThen + funcsElse_
