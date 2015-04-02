
from selector2 import *

class x86Selector(x86Selector):

    def visitAssAttr(self, n, args=None):

        pass

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
        inst = []
        test = self.dispatch(n.test)
        tstVar = self.getCurrTemp()
        body = self.dispatch(n.body)
        inst.append(x86While([test, x86Push(tstVar), x86Call('is_true'),
                              x86Add(x86Const('4'), x86Register('esp')),
                              x86Cmp(x86Const(1), x86Register('eax'))],
                             body))
        return inst

    # If -----------------------------------------------------------------------
    def visitIf(self, n, args=None):
        inst = []
        test = self.dispatch(n.tests[0][0])
        # our test result
        tstVar = self.getCurrTemp()
        thn = self.dispatch(n.tests[0][1])
        els = self.dispatch(n.else_)

        inst.append(x86If([test, x86Push(tstVar), x86Call('is_true'),
                x86Add(x86Const(4), x86Register('esp')),
                x86Cmp(x86Const(1), x86Register('eax'))],
                          thn, els))
        return inst
