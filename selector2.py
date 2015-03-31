__author__ = 'ty'

from selector1 import *

class x86Selector(x86Selector):

    # Functions ----------------------------------------------------------------
    def visitFunction(self, n, args=None):
        stkCount = 0
        inst = []
        inst.append(x86Label(n.name.name))
        inst.append(x86Push(x86Register('ebp')))
        inst.append(x86Mov(x86Register('esp'), x86Register('ebp')))

        locals = set(UniquifyVisitor().findLocals(n))
        inst.append(x86Sub(x86Const(len(locals)*4), x86Register('esp')))

        (instr, sCnt) = self.pushCalleeSaves(stkCount)
        stkCount += sCnt
        inst += instr

        for arg in n.argnames:
            inst.append(x86Mov(x86StkLoc(stkCount), self.updateSymTable(arg)))
            stkCount +=4
        # collect body stmts
        inst += self.dispatch(n.code)

        inst += self.popCalleeSaves()
        inst.append(x86Add(x86Const(len(locals)*4), x86Register('esp')))
        inst += [x86Leave(), x86Ret()]
        return inst

    def visitReturn(self, n, args=None):
        inst = []
        inst += self.dispatch(n.value)
        inst.append(x86Mov(self.getCurrTemp(), x86Register('eax')))
        return inst

    # Custom operators ---------------------------------------------------------
    def visitIndirectCall(self, n, args=None):
        inst = []
        for arg in reversed(n.args):
            inst += self.dispatch(arg)
            inst.append(x86Push(self.getNextTemp()))
        inst += self.dispatch(n.node)
        #call*
        inst.append(x86CallPtr(self.getCurrTemp()))
        inst.append(x86Mov(x86Register('eax'), self.getNextTemp()))
        inst.append(x86Add(x86Const(len(n.args)*4), x86Register('esp')))
        return inst

    def visitClosure(self, n, args=None):
        inst = []
        inst += self.dispatch(n.symTable)
        inst.append(x86Push(self.getCurrTemp()))
        inst.append(x86Push(x86Label(n.name.name)))
        inst.append(x86Call('create_closure'))
        inst.append(x86Mov(x86Register('eax'), self.getNextTemp()))
        inst.append(x86Add(x86Const(8), x86Register('esp')))
        return inst

    def visitGetFreeVars(self, n, args=None):
        inst = []
        inst += self.dispatch(n.name)
        inst.append(x86Push(self.getCurrTemp()))
        inst.append(x86Call('get_free_vars'))
        inst.append(x86Mov(x86Register('eax'), self.getNextTemp()))
        inst.append(x86Add(x86Const(4), x86Register('esp')))
        return inst

    def visitGetFunPtr(self, n, args=None):
        inst = []
        inst += self.dispatch(n.name)
        inst.append(x86Push(self.getCurrTemp()))
        inst.append(x86Call('get_fun_ptr'))
        inst.append(x86Mov(x86Register('eax'), self.getNextTemp()))
        inst.append(x86Add(x86Const(4), x86Register('esp')))
        return inst

if __name__ == '__main__':
    import sys
    import compiler
    from explicate2 import *
    from uniquify import *
    from heapify2 import *
    from closure2 import *
    from flatten2 import *
    pyfi = 'x = 2'
    toExplicate = None
    if len(sys.argv) != 2:
        print 'Usage: %s <pythonFile.py>' % (sys.argv[0])
        tree = compiler.parse(pyfi)
    elif sys.argv[1][-3:] != '.py':
        print 'Error: file is not a python file.'
        raise SystemExit(1)
    else:
        try:
            print "-"*20 + "Parsed AST" + "-"*20
            print compiler.parseFile(sys.argv[1])
            toExplicate = compiler.parseFile(sys.argv[1])
            outFile = sys.argv[1][:-3] + ".s"

        except IOError as e:
            print 'Unable to open %s: %s' % (sys.argv[1], e)
        except:
            pass
    uq = UniquifyVisitor()
    ex = ExplicateVisitor()
    hp = HeapifyVisitor()
    cl = ClosureVisitor()
    fl = FlatVisitor()
    sl = x86Selector()

    print "-"*20 + "Uniquified AST" + "-"*20
    toExplicate = UniquifyVisitor().dispatch(toExplicate)
    UniquifyVisitor().print_ast(toExplicate.node)

    print "-"*20 + "Explicated AST" + "-"*20
    explicated = ExplicateVisitor().dispatch(toExplicate)
    UniquifyVisitor().print_ast(explicated.node)

    print "-"* 20 + "Heapified AST" + "-"*20
    heapified = HeapifyVisitor().dispatch(explicated)
    UniquifyVisitor().print_ast(Stmt(heapified))

    print "-"*20 + "Global Func List" + "-"*20
    (ast, fun_list) = ClosureVisitor().dispatch(heapified)
    UniquifyVisitor().print_ast(Stmt(fun_list))

    print "-"*20 + "Closure Converted AST" + "-"*20
    UniquifyVisitor().print_ast(ast.node)

    print "-"*20 + "Final Func List" + "-"*20
    to_flatten = ClosureVisitor().doClosure(heapified)
    UniquifyVisitor().print_ast(Stmt(to_flatten))

    print "-"*20 + "Flattened Func List" + "-"*20
    flattened = FlatVisitor().dispatch(to_flatten)
    UniquifyVisitor().print_ast(Stmt(flattened))

    print "-"*20 + "x86IR" + "-"*20
    ir_list = []
    for func in flattened:
        ir_list += x86Selector().dispatch(func)
    for func in ir_list:
        print func
    # print 'initial tree-------\n', tree, '\n'
    #
    # toExplicate = uq.dispatch(tree)
    # print tree
    # print '\nuniquify ......................... [pass]\n'
    #
    # explicated = ex.dispatch(toExplicate)
    # print explicated
    # print '\nexplicate .........................[pass]\n'
    #
    # heapified = hp.dispatch(explicated)
    # print heapified
    # print '\nheapify ...........................[pass]\n'
    # (ast, funcList) = cl.dispatch(heapified)
    #
    # print funcList
    # print ast
    # toFlatten = cl.doClosure(heapified)
    # #tree = cl.doClosure(funcList)
    # print toFlatten
    # print '\nclosure ...........................[pass]\n'
    #
    # flattened = fl.dispatch(toFlatten)
    # print flattened
    # print '\nflatten ...........................[pass]\n'
    # l = sl.dispatch(flattened[0])
    # for i in l:
    #     print i
    #
    # print '\nx86selector .......................[pass]\n'

