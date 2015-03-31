from pyAST import *
from tourist import Visitor


class ExplicateVisitor(Visitor):
    _tmpCounter = 0

    def __init__(self):
        super(ExplicateVisitor, self).__init__()

    # Helper methods----------------------------------
    def getNextTemp(self):
        self._tmpCounter += 1
        tmp = "___expTmp" + str(self._tmpCounter)
        return tmp

    def getCurrTemp(self):
        tmp = "___expTmp" + str(self._tmpCounter)
        return tmp

    def compareType(self, lhs, tag):
        return InjectFrom(tagof[BOOL_t], IntCompare(InjectFrom(tagof[INT_t],
                                                               GetTag(lhs)),
                                                    ['==',
                                                     InjectFrom(tagof[INT_t],
                                                                tag)]))

    def metaCompareType(self, left, right, tagl, tagr):
        return And([self.compareType(left, tagof[tagl]),
                    self.compareType(right, tagof[tagr])])

    # Add helper functions
    def metaIntAdd(self, left, right, tagl, tagr):
        return InjectFrom(tagof[INT_t],
                          IntAdd((ProjectTo(tagof[tagl], left),
                                  ProjectTo(tagof[tagr], right))))

    def metaBigAdd(self, left, right):
        return InjectFrom(tagof[BIG_t],
                          BigAdd((ProjectTo(tagof[BIG_t], left),
                                  ProjectTo(tagof[BIG_t], right))))

    def metaAdd(self, left, right):
        return IfExp(self.metaCompareType(left, right, INT_t, INT_t),
                     self.metaIntAdd(left, right, INT_t, INT_t),
                     IfExp(self.metaCompareType(left, right, INT_t, BOOL_t),
                           self.metaIntAdd(left, right, INT_t, BOOL_t),
                           IfExp(
                               self.metaCompareType(left, right, BOOL_t, INT_t),
                               self.metaIntAdd(left, right, BOOL_t, INT_t),
                               IfExp(self.metaCompareType(left, right, BOOL_t,
                                                          BOOL_t),
                                     self.metaIntAdd(left, right, BOOL_t,
                                                     BOOL_t),
                                     IfExp(self.metaCompareType(left, right,
                                                                BIG_t, BIG_t),
                                           self.metaBigAdd(left, right),
                                           CallFunc(Name('type_error'), []))))))

    # Compare helper functions
    def metaIntCompare(self, left, right, tagl, tagr, op):
        if tagl == BIG_t:
            return BigCompare(ProjectTo(tagof[tagl], left),
                              [(op, ProjectTo(tagof[tagr], right))])
        return IntCompare(ProjectTo(tagof[tagl], left),
                          [(op, ProjectTo(tagof[tagr], right))])

    def metaBigCompare(self, left, right, op):
        return BigCompare(ProjectTo(tagof[BIG_t], left),
                          [(op, ProjectTo(tagof[BIG_t], right))])

    def metaCompare(self, left, right, op):

        default = Const(1) if op == '==' else Const(
            0)  # true for equality and False for inequality '!='
        return IfExp(self.metaCompareType(left, right, INT_t, INT_t),
                     self.metaIntCompare(left, right, INT_t, INT_t, op),
                     IfExp(self.metaCompareType(left, right, INT_t, BOOL_t),
                           self.metaIntCompare(left, right, INT_t, INT_t, op),
                           IfExp(
                               self.metaCompareType(left, right, BOOL_t, INT_t),
                               self.metaIntCompare(left, right, INT_t, INT_t,
                                                   op),
                               IfExp(
                                   self.metaCompareType(left, right, BOOL_t,
                                                        BOOL_t),
                                   self.metaIntCompare(left, right, INT_t,
                                                       INT_t, op),
                                   IfExp(
                                       self.metaCompareType(left, right, BIG_t,
                                                            BIG_t),
                                       self.metaBigCompare(left, right, op),
                                       default, )))))


    # Visitor Methods-----------------------------------------------------------
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
            stmtList += [self.dispatch(child)]
        return Stmt(stmtList)

    # Stmt :== atomic OP_ASSIGN expr | print expr | expr | e--------------------
    #
    def visitAssign(self, n, args=None):
        # Assign attributes
        # nodes            a list of assignment targets, one per equal sign
        # expr             the value being assigned
        # left = expr
        left = self.dispatch(n.nodes[0], True)
        expr = self.dispatch(n.expr, True)
        return Assign([left], expr)

    def visitDiscard(self, n, args=None):
        # Discard attributes
        # expr
        # discard (expr)
        return Discard(self.dispatch(n.expr, True))

    def visitPrintnl(self, n, args=None):
        # Printnl attributes
        # nodes
        # dest
        expr = self.dispatch(n.nodes[0], True)
        return Printnl([expr], None)

    # expr:== atomic binOp (expr|atomic) | unaryOp (expr|atomic) | CallFunc(...)
    #                   ifExp

    def visitCallFunc(self, n, args=None):
        # CallFunc attributes
        # node             expression for the callee
        # args             a list of arguments
        # star_args        the extended *-arg value
        # dstar_args       the extended **-arg value
        return InjectFrom(tagof[INT_t], n)

    def visitIfExp(self, n, args=None):
        tmp = Name(self.getNextTemp())
        return Let(tmp, self.dispatch(n.test),
                    IfExp(tmp, self.dispatch(n.then), self.dispatch(n.else_)))

    # binOp::= (+)----------------------
    def visitAdd(self, n, args=None):
        # And attributes
        # left             left operand
        # right            right operand
        right = self.dispatch(n.right, True)
        left = self.dispatch(n.left, True)

        tmpl = Name(self.getNextTemp())
        tmpr = Name(self.getNextTemp())
        return Let(tmpl, left, Let(tmpr, right, self.metaAdd(tmpl, tmpr)))

    def visitCompare(self, n, args=None):
        left = self.dispatch(n.expr)
        right = self.dispatch(n.ops[0][1])
        tmpl = Name(self.getNextTemp())
        tmpr = Name(self.getNextTemp())
        if n.ops[0][0] == 'is':
            return Let(tmpl, left,
                       Let(tmpr, right, InjectFrom(tagof[BOOL_t],
                                                   IsCompare(tmpl, [
                                                       (n.ops[0][0], tmpr)]))))
        return Let(tmpl, left,
                   Let(tmpr, right, InjectFrom(tagof[BOOL_t],
                                               self.metaCompare(tmpl, tmpr,
                                                                n.ops[0][0]))))

    def visitOr(self, n, args=None):
        left = self.dispatch(n.nodes[0])
        tmpl = Name(self.getNextTemp())
        return Let(tmpl, left,
                   IfExp(tmpl, tmpl, self.dispatch(n.nodes[1])))

    def visitAnd(self, n, args=None):
        left = self.dispatch(n.nodes[0])
        tmpl = Name(self.getNextTemp())
        return Let(tmpl, left, IfExp(tmpl, self.dispatch(n.nodes[1]), tmpl))

    # unaryOp::= (-) -----------------------

    def visitUnarySub(self, n, args=None):
        # UnarySub attributes
        # expr
        expr = self.dispatch(n.expr, True)
        tmp = Name(self.getNextTemp())
        return Let(tmp, expr,
                   IfExp(self.compareType(tmp, tagof[INT_t]),
                         InjectFrom(tagof[INT_t],
                                    UnarySub(ProjectTo(tagof[INT_t], tmp))),
                         IfExp(self.compareType(tmp, tagof[BOOL_t]),
                               InjectFrom(tagof[INT_t], UnarySub(
                                   ProjectTo(tagof[BOOL_t], tmp))),
                               CallFunc(Name('type_error'), []))))

    def visitNot(self, n):
        expr = self.dispatch(n.expr)
        tmp = Name(self.getNextTemp())
        return Let(tmp, expr, InjectFrom(tagof[BOOL_t],
                                  IfExp(tmp, Const(0), Const(1))))

    # leaves/atomics ::= variable(name) | Const(int)----------------------------

    def visitAssName(self, n, args=None):
        # AssName attributes
        # name             name being assigned to
        # flags            XXX
        return n

    def visitConst(self, n, args=None):
        # Const attributes
        # value
        return InjectFrom(tagof[INT_t], Const(n.value))

    def visitName(self, n, args=None):
        # Name attributes
        # name
        if n.name == TRUE or n.name == FALSE:
            # convert to pyobj 1 bool
            return InjectFrom(tagof[BOOL_t], n)
        return n

    def visitList(self, n, args=None):
        lst = List([])
        for exp in n.nodes:
            lst.nodes.append(self.dispatch(exp))
        return InjectFrom(tagof[BIG_t], lst)

    def visitDict(self, n, args=None):
        dct = Dict([])
        for exp in n.items:
            dct.items.append((self.dispatch(exp[0]), self.dispatch(exp[1])))
        return InjectFrom(tagof[BIG_t], dct) ############

    def visitSubscript(self, n, args=None):
        return Subscript(self.dispatch(n.expr), n.flags,
                         [self.dispatch(nd) for nd in n.subs])


if __name__ == '__main__':
    import sys
    import compiler

    pyfi = 'a[2]'

    if len(sys.argv) != 2:
        # print 'Usage: %s <pythonFile.py>' % (sys.argv[0])
        tree = compiler.parse(pyfi)
    elif sys.argv[1][-3:] != '.py':
        print 'Error: file is not a python file.'
        raise SystemExit(1)
    else:
        try:
            tree = compiler.parseFile(sys.argv[1])
            outFile = sys.argv[1][:-3] + ".s"
        except IOError as e:
            print 'Unable to open %s: %s' % (sys.argv[1], e)

    visitor = ExplicateVisitor()
    print tree
    print visitor.preorder(tree, visitor, True)
