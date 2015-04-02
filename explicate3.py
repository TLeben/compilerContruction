from explicate2 import *
from pyAST import *

class ExplicateVisitor(ExplicateVisitor):

    def __init__(self):
        super(ExplicateVisitor, self).__init__()

    def visitAssAttr(self, n, args=None):
        return AssAttr(self.dispatch(n.expr), n.attrname, n.flags)

    def visitGetattr(self, n, args=None):
        return Getattr(self.dispatch(n.expr), n.attrname)

    def visitHasAttr(self, n, args=None):
        return InjectFrom(tagof[INT_t],
                          HasAttr(self.dispatch(n.expr), n.attrname))

    def visitCreateClass(self, n, args=None):
        return  InjectFrom(tagof[BIG_t],
                          CreateClass([self.dispatch(b) for b in n.bases]))


    def visitWhile(self, n, args=None):
        return While(self.dispatch(n.test),
                     self.dispatch(n.body), None)

    def visitIf(self, n, args=None):
        return If([self.dispatch(n.tests[0][0]),
                   self.dispatch(n.tests[0][1])],
                  self.dispatch(n.else_))


