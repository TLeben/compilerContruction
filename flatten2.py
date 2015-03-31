from flatten1 import *



class FlatVisitor(FlatVisitor):

    def __init__(self):
        super(FlatVisitor, self).__init__()

    def visitFunction(self, n, args=None):
        return Function(n.decorators, n.name,
                        n.argnames, n.defaults,
                        n.flags, n.doc, Stmt(self.dispatch(n.code).nodes))

    def visitLambda(self, n, args=None):
        return Lambda(n.argnames,
                      n.defaults,
                      n.flags,
                      self.dispatch(n.code)), []

    def visitReturn(self, n, args=None):
        (value, stmt) = self.dispatch(n.value)
        return Return(value), stmt

    def visitClosure(self, n, args=None):
        (flatName, nameStmt) = self.dispatch(n.name)
        (flatSyms, envStmt) = self.dispatch(n.symTable)
        tmp = self.getNextTemp()
        return Name(tmp), envStmt + nameStmt + \
               [Assign([AssName(tmp, 'OP_ASSIGN')],
                       Closure(flatName, flatSyms))]

    def visitIndirectCall(self, n, args=None):
        (result, stmt) = self.dispatch(n.node)
        res = []
        stm = []
        for e in n.args:
            (result, stmt) = self.dispatch(e)
            res += [result]
            stm += stmt
        tmp = self.getNextTemp()
        return Name(tmp), stm + \
               [Assign([AssName(tmp, 'OP_ASSIGN')], IndirectCall(result, res))]

    def visitGetFunPtr(self, n, args=None):
        (result, stmts) = self.dispatch(n.name)
        tmp = self.getNextTemp()
        return Name(tmp), stmts + \
               [Assign([AssName(tmp, 'OP_ASSIGN')], GetFunPtr(result))]

    def visitGetFreeVars(self, n, args=None):
        (result, stmts) = self.dispatch(n.name)
        tmp = self.getNextTemp()
        return Name(tmp), stmts + \
               [Assign([AssName(tmp, 'OP_ASSIGN')], GetFreeVars(result))]

    def visitlist(self, n, args=None):
        fList = []
        for func in n:
            fList += [self.dispatch(func)]
        return fList





if __name__ == '__main__':
    import sys
    import compiler
    from explicate2 import *
    from uniquify import *
    from heapify2 import *
    pyfi = 'x = 2'

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

        except IOError as e:
            print 'Unable to open %s: %s' % (sys.argv[1], e)
        except:
            pass
    uq = UniquifyVisitor()
    ex = ExplicateVisitor()
    hp = HeapifyVisitor()
    fl = FlatVisitor()
    print 'initial tree-------\n',tree, '\n'
    tree = uq.preorder(tree, uq, {})
    print tree
    print '\nuniquify ......................... [pass]\n'
    tree = ex.preorder(tree, ex)
    print tree
    print '\nexplicate .........................[pass]\n'
    tree = hp.preorder(tree, hp)
    print tree
    print '\nheapify ...........................[pass]\n'
    tree = fl.preorder(tree, fl, True)
    for i in tree.node:
        print i, '\n'
    print '\nflatten ...........................[pass]\n'


