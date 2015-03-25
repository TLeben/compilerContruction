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
        return stmt + [Return(value)]

    def visitClosure(self, n, args=None):
        (flat_name, name_stmt) = self.dispatch(n.name)
        (flat_env, env_stmt) = self.dispatch(n.env)
        tmp = self.getNextTemp()
        assn = Assign([AssName(tmp, 'OP_ASSIGN')], Closure(flat_name, flat_env))
        return Name(tmp), env_stmt + name_stmt + [assn]

    def visitIndirectCall(self, n, args=None):
        (result, stmt) = self.dispatch(n.node)
        res = []
        stm = []
        for e in n.args:
            (result, stmt) = self.dispatch(e)
            res += [result]
            stm += stmt
        tmp = self.getNextTemp()
        assn = Assign([AssName(tmp, 'OP_ASSIGN')], IndirectCall(result, res))
        return Name(tmp), stm + [assn]

    def visitGetFunPtr(self, n, args=None):
        (result, stmts) = self.dispatch(n.name)
        tmp = self.getNextTemp()
        assn = Assign([AssName(tmp, 'OP_ASSIGN')], GetFunPtr(result))
        return Name(tmp), stmts + [assn]

    def visitGetFreeVars(self, n, args=None):
        (result, stmts) = self.dispatch(n.name)
        tmp = self.getNextTemp()
        assn = Assign([AssName(tmp, 'OP_ASSIGN')], GetFreeVars(result))
        return Name(tmp), stmts + [assn]

    def visitlist(self, n, args=None):
        fList = []
        for func in n:
            fList += [self.visit(func)]
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
    #print tree
    tree = uq.preorder(tree, uq, {})
    print 'uniquify ......................... [pass]'
    tree = ex.preorder(tree, ex)
    print 'explicate .........................[pass]'
    tree = hp.preorder(tree, hp)
    print 'heapify ...........................[pass]'
    tree = fl.preorder(tree, fl, True)
    print 'flatten ...........................[pass]'
    print tree

