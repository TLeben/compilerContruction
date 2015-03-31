__author__ = 'ty'
from selector import *

class x86Selector(x86Selector):

    # If -----------------------------------------------------------------------
    def visitIf(self, n, args=None):
        inst = []
        test = self.dispatch(n.tests[0][0])
        # our test result
        result = self.getCurrTemp()
        thn = self.dispatch(n.tests[0][1])
        els = self.dispatch(n.else_)
        cmpr = [x86Push(result), x86Call('is_true')
        , x86Add(x86Const(4), x86Register('esp')),
        x86Cmp(x86Const(1), x86Register('eax'))]
        inst.append(x86If(test + cmpr, thn, els))
        return inst

    # Compares -----------------------------------------------------------------
    def visitIsCompare(self, n, args=None):
        inst = []
        inst += self.dispatch(n.expr)
        left = self.getCurrTemp()
        inst += self.dispatch(n.ops[0][1])
        right = self.getCurrTemp()
        inst.append(x86If([x86Cmp(left, right)],
                          [x86Mov(x86Const(1), self.getNextTemp())],
                          [x86Mov(x86Const(0), self.getCurrTemp())]))
        return inst


    def visitIntCompare(self, n, args=None):
        inst = []
        inst += self.dispatch(n.expr)
        left = self.getCurrTemp()
        inst += self.dispatch(n.ops[0][1])
        right = self.getCurrTemp()
        if n.ops[0][0] == '==':
            inst.append(x86If([x86Cmp(left, right)],
                          [x86Mov(x86Const(1), self.getNextTemp())],
                          [x86Mov(x86Const(0), self.getCurrTemp())]))
        elif n.ops[0][0] == '!=':
            inst.append(x86If([x86Cmp(left, right)],
                          [x86Mov(x86Const(0), self.getNextTemp())],
                          [x86Mov(x86Const(1), self.getCurrTemp())]))
        return inst

    def visitBigCompare(self, n, args=None):
        inst = []
        inst += self.dispatch(n.expr)
        left = self.getCurrTemp()
        inst += self.dispatch(n.ops[0][1])
        right = self.getCurrTemp()
        inst.append(x86Push(left))
        inst.append(x86Push(right))
        if n.ops[0][0] == '==':
            inst.append(x86Call('equal'))
        elif n.ops[0][0] == '!=':
            inst.append(x86Call('not_equal'))
        inst.append(x86Mov(x86Register('eax'), self.getNextTemp()))
        inst.append(x86Add(x86Const(8), x86Register('esp')))
        return inst

    # Adds ---------------------------------------------------------------------
    def visitIntAdd(self, n, args=None):
        inst = []
        inst += self.dispatch(n.left)
        lVar = self.getCurrTemp()
        inst += self.dispatch(n.right)
        rVar = self.getCurrTemp()
        inst.append(x86Add(lVar, rVar))
        inst.append(x86Mov(rVar, self.getNextTemp()))
        return inst

    def visitBigAdd(self, n, args=None):
        inst = []
        inst += self.dispatch(n.left)
        lVar = self.getCurrTemp()
        inst += self.dispatch(n.right)
        rVar = self.getCurrTemp()

        inst.append(x86Push(rVar))
        inst.append(x86Push(lVar))
        inst.append(x86Call('add'))
        inst.append(x86Add(x86Const(8), x86Register('esp')))
        inst.append(x86Mov(x86Register('eax'), self.getNextTemp()))

    # Logical Operators --------------------------------------------------------
    def visitAnd(self, n, args=None):
        inst = []
        inst += self.dispatch(n.nodes[0])
        left = self.getCurrTemp()
        inst.append(x86Push(left))
        inst.append(x86Call('is_true'))
        inst.append(x86Add(x86Const(4), x86Register('esp')))
        leftResult = self.getNextTemp()
        inst.append(x86If([x86Cmp(x86Const(0), x86Register('eax'))],
                          [x86Mov(left, leftResult)],
                          self.dispatch(n.nodes[1]) +
                          [x86Mov(self.getCurrTemp(), leftResult)]))
        inst.append(x86Mov(leftResult, self.getNextTemp()))
        return inst

    def visitOr(self, n, args=None):
        inst = []
        inst += self.dispatch(n.nodes[0])
        left = self.getCurrTemp()
        inst.append(x86Push(left))
        inst.append(x86Call('is_true'))
        inst.append(x86Add(x86Const(4), x86Register('esp')))
        leftResult = self.getNextTemp()
        inst.append(x86If([x86Cmp(x86Const(1), x86Register('eax'))],
                          [x86Mov(left, leftResult)],
                          self.dispatch(n.nodes[1]) +
                          [x86Mov(self.getCurrTemp(), leftResult)]))
        inst.append(x86Mov(leftResult, self.getNextTemp()))
        return inst

    def visitNot(self, n, args=None):
        pass

    # Polymorphic operators ----------------------------------------------------
    def visitGetTag(self, n, args = None):
        inst = []
        inst += self.dispatch(n.arg)
        arg = self.getCurrTemp()
        inst.append(x86Push(arg))
        inst.append(x86Call('tag'))
        result = self.getNextTemp()
        inst.append(x86Mov(x86Register('eax'), result))
        inst.append(x86Add(x86Const(4), x86Register('esp')))
        return inst

    def visitProjectTo(self, n, args=None):
        inst = []
        inst += self.dispatch(n.arg)
        arg = self.getCurrTemp()
        inst.append(x86Push(arg))
        inst += self.dispatch(n.typ)
        typ = self.getCurrTemp()
        result = self.getNextTemp()
        if isinstance(typ, Const) and typ.value == 0: #int
            inst.append(x86Call('project_int'))
        if isinstance(typ, Const) and typ.value == 0: #boolean
            inst.append(x86Call('project_bool'))
        if isinstance(typ, Const) and typ.value == 0: #big or function
            inst.append(x86Call('project_big'))
        else:
            inst.append(
                x86If([x86Cmp(x86Const(0),typ)], [x86Call('project_int')],
                    [x86If([x86Cmp(x86Const(1),typ)], [x86Call('project_bool')],
                    [x86If([x86Cmp(x86Const(2),typ)], [x86Call('project_big')],
                    [x86If([x86Cmp(x86Const(3),typ)], [x86Call('project_big')],
                    [])])])]))

        inst.append(x86Mov(x86Register('eax'),result))
        inst.append(x86Add(x86Const(4), x86Register('esp')))
        return inst
    def visitInjectFrom(self, n, args=None):
        inst = []
        inst += self.dispatch(n.arg)
        arg = self.getCurrTemp()
        inst.append(x86Push(arg))
        inst += self.dispatch(n.typ)
        typ = self.getCurrTemp()
        result = self.getNextTemp()

        if isinstance(typ,Const) and typ.value == 0: # int
            inst.append(x86Call('inject_int'))
        elif isinstance(typ, Const) and typ.value == 1:  # bool
            inst.append(x86Call('inject_bool'))
        elif isinstance(typ, Const) and (typ.value == 3): #big or Function
            inst.append(x86Call('inject_big'))
        else:
            inst.append(
                x86If([x86Cmp(x86Const(0),typ)], [x86Call('inject_int')],
                    [x86If([x86Cmp(x86Const(1),typ)], [x86Call('inject_bool')],
                    [x86If([x86Cmp(x86Const(2),typ)], [x86Call('inject_big')],
                    [x86If([x86Cmp(x86Const(3),typ)], [x86Call('inject_big')],
                    [])])])]))

        inst.append(x86Mov(x86Register('eax'),result))
        inst.append(x86Add(x86Const(4), x86Register('esp')))
        return inst

    # Lists and Dicts ----------------------------------------------------------

    def visitList(self, n, args=None):
        inst = []
        iCount = 0
        inst.append(x86Push(x86Const(len(n.nodes) << 2)))
        inst.append(x86Call('create_list'))
        lst = self.getNextTemp()
        inst.append(x86Mov(x86Register('eax'), lst))
        inst.append(x86Add(x86Const(4), x86Register('esp')))
        inst.append(x86Push(lst))
        inst.append(x86Call('inject_big'))
        inst.append(x86Mov(x86Register('eax'), lst))
        inst.append(x86Add(x86Const(4), x86Register('esp')))
        for e in n.nodes:
            inst += self.dispatch(e)
            inst.append(x86Push(self.getCurrTemp()))
            inst.append(x86Push(x86Const(iCount << 2)))
            inst.append(x86Push(lst))
            inst.append(x86Call('set_subscript'))
            inst.append(x86Add(x86Const(12), x86Register('esp')))
            iCount += 1

        inst.append(x86Push(lst))
        inst.append(x86Call('project_big'))
        inst.append(x86Mov(x86Register('eax'), self.getNextTemp()))
        inst.append(x86Add(x86Const(4), x86Register('esp')))
        return inst

    def visitDict(self, n, args=None):
        inst = []
        inst.append(x86Call('create_dict'))
        inst.append(x86Mov(x86Register('eax'), self.getNextTemp()))
        inst.append(x86Push(self.getCurrTemp()))
        inst.append(x86Call('inject_big'))
        dct = self.getNextTemp()
        inst.append(x86Mov(x86Register('eax'), dct))
        inst.append(x86Add(x86Const(4), x86Register('esp')))

        for e in n.items:
            inst += self.dispatch(e[1])
            val = self.getCurrTemp()
            inst += self.dispatch(e[0])
            key = self.getCurrTemp()
            inst.append(x86Push(val))
            inst.append(x86Push(key))
            inst.append(x86Push(dct))
            inst.append(x86Call('set_subscript'))
            inst.append(x86Add(x86Const(12), x86Register('esp')))

        inst.append(x86Push(dct))
        inst.append(x86Call('project_big'))
        inst.append(x86Mov(x86Register('eax'), self.getNextTemp()))
        inst.append(x86Add(x86Const(4), x86Register('esp')))
        return inst

    def visitSubscript(self, n, args=None):
        inst = []
        if n.flags == 'OP_ASSIGN':
            inst.append(x86Push(self.getCurrTemp()))

        inst += self.dispatch(n.expr)
        arg = self.getCurrTemp()
        inst += self.dispatch(n.subs[0])
        sub = self.getCurrTemp()
        result = self.getNextTemp()

        if n.flags == 'OP_APPLY':
            # Call get subscript
            inst.append(x86Push(sub))
            inst.append(x86Push(arg))
            inst.append(x86Call('get_subscript'))
            inst.append(x86Add(x86Const(8), x86Register('esp')))
        elif n.flags == 'OP_ASSIGN':
            inst.append(x86Push(sub))
            inst.append(x86Push(arg))
            inst.append(x86Call('set_subscript'))
            inst.append(x86Add(x86Const(12), x86Register('esp')))

        inst.append(x86Mov(x86Register('eax'), result))
        return inst

