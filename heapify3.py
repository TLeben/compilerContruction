from heapify2 import *
from pyAST import *
from freeVars3 import *


class HeapifyVisitor(HeapifyVisitor):
    def visitAssAttr(self, n, args=None):
        (below, expr) = self.dispatch(n.expr)
        return below, AssAttr(expr, n.attrname, n.flags)

    def visitGetattr(self, n, args=None):
        (below, expr) = self.dispatch(n.expr)
        return below, AssAttr(expr, n.attrname)

    def visitHasAttr(self, n, args=None):
        (below, expr) = self.dispatch(n.expr)
        return below, AssAttr(expr, n.attrname)

    def visitCreateClass(self, n, args=None):
        freeBelows = []
        baseList = []
        for b in n.bases:
            (below, bases) = self.dispatch(b)
            freeBelows += below
            baseList.append(bases)
        return freeBelows, CreateClass(baseList)

    def visitWhile(self, n, args=None):
        (testBelow, test) = self.dispatch(n.test)
        (bodyBelow, body)= self.dispatch(n.body)
        return testBelow + bodyBelow, While(test, body, None)

    def visitIf(self, n, args=None):
        (testBelow, test)   = self.dispatch(n.tests[0][0])
        (thenBelow, then)   = self.dispatch(n.tests[0][1])
        (else_Below, else_) = self.dispatch(n.else_)
        return testBelow + thenBelow + else_Below, If([(test, then)], else_)
