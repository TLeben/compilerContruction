from explicate import *


class ExplicateVisitor(ExplicateVisitor):

    def __init__(self):
        super(ExplicateVisitor, self).__init__()

    def visitCallFunc(self, n, args=None):
        if isinstance(n.node, Name) and n.node.name == 'input':
            expr = Name(self.getNextTemp())
            return Let(expr, n, InjectFrom(tagof[INT_t], expr))
        args = []
        n.args = [self.dispatch(arg) for arg in n.args]
        nd = self.dispatch(n.node)

        tmpFunc = Name(self.getNextTemp())
        bTmp = Name(self.getNextTemp())
        iTmp = Name(self.getNextTemp())
        lets = []
        for arg in n.args:
            lets.append(Name(self.getNextTemp()))

        body = \
            IfExp(InjectFrom(tagof[INT_t], CallFunc(Name('is_class'), [tmpFunc])),
            Let(bTmp, InjectFrom(tagof[BIG_t], CallFunc(Name('create_object'), [tmpFunc])),
            IfExp(InjectFrom(tagof[INT_t], HasAttr(tmpFunc, '__init__')),
            Let(iTmp, InjectFrom(tagof[FUN_t], CallFunc(Name('get_function'),
            [Getattr(tmpFunc, '__init__')])), (Name(self.getNextTemp()),
            CallFunc(iTmp, [bTmp] + lets), bTmp)), bTmp)),
            IfExp( InjectFrom(tagof[INT_t], CallFunc(Name('is_bound_method'), [tmpFunc])),
            CallFunc(InjectFrom(tagof[FUN_t], CallFunc(Name('get_function'), [tmpFunc])),
            [InjectFrom(tagof[BIG_t], CallFunc(Name('get_receiver'), [tmpFunc]))]+lets),
            IfExp(InjectFrom(tagof[INT_t], CallFunc(Name('is_unbound_method'), [tmpFunc])),
            CallFunc(InjectFrom(tagof[FUN_t], CallFunc(Name('get_function'), [tmpFunc])), lets),
            CallFunc(tmpFunc, lets))))

        i = 0
        for arg in n.args:
            body = Let(lets[i], arg, body)
            i += 1

        return Let(tmpFunc, nd, body )
        #return CallFunc(self.dispatch(n.node), n.args)


    def visitReturn(self, n, args=None):
        return Return(self.dispatch(n.value))

    def visitFunction(self, n, args=None):
        lam = Lambda(n.argnames, n.defaults, n.flags,
                     self.dispatch(n.code))
        #lam.localVars = n.localVars
        return Assign([AssName(n.name, 'OP_ASSIGN')],
                      InjectFrom(tagof[FUN_t], lam))

    def visitLambda(self, n, args=None):
        lam = Lambda(n.argnames, n.defaults, n.flags,
                     Stmt([self.dispatch(Return(n.code))]))
        #lam.localVars = n.localVars
        return InjectFrom(tagof[FUN_t], lam)


if __name__ == '__main__':
    import sys
    import compiler
    from uniquify import *

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
    uq = UniquifyVisitor()
    ex = ExplicateVisitor()
    print tree
    print uq.preorder(tree, uq)
    print ex.preorder(tree, ex, True)

