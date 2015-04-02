from uniquify import *
from pyAST import *


class UniquifyVisitor(UniquifyVisitor):

    def visitAssAttr(self, n, symTable):
        return AssAttr(self.dispatch(n.expr, symTable), n.attrname, n.flags)

    def visitGetattr(self, n, symTable):
        return Getattr(self.dispatch(n.expr, symTable), n.attrname)

    def visitHasAttr(self, n, symTable):
        return HasAttr(self.dispatch(n.expr, symTable), n.attrname)

    def visitCreateClass(self, n, symTable):
        body = []
        for b in n.bases:
            body.append(self.dispatch(b, symTable))
        return CreateClass(body)

    def visitWhile(self, n, symTable):
        n.test = self.dispatch(n.test, symTable)
        n.body = self.dispatch(n.body,symTable)
        return n

    def visitIf(self, n, symTable):
        n.tests = [(self.dispatch(n.tests[0][0], symTable),
                    self.dispatch(n.tests[0][1], symTable))]
        n.else_ = self.dispatch(n.else_, symTable)

