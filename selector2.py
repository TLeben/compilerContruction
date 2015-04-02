__author__ = 'ty'

from selector1 import *

class x86Selector(x86Selector):

    # Functions ----------------------------------------------------------------
    def visitFunction(self, n, args=None):
        stkCount = 0
        inst = []
        inst.append(x86FunLabel(n.name.name))
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

    def prettyPrint(self, inst, indents=0):
        for i in inst:
            if isinstance(i, x86If):
                print "\t" * indents + "If: " + repr(i.operandList[0])
                self.prettyPrint(i.operandList[1], indents+1)
                print "\t" * indents + "Else:"
                self.prettyPrint(i.operandList[2], indents+1)
                print "\t" * indents + "EndIf"
            else:
                print "\t" * indents + repr(i)


if __name__ == '__main__':
    import sys
    import compiler
    from declassify3 import *
    from explicate3 import *
    from uniquify3 import *
    from heapify3 import *
    from closure3 import *
    from flatten3 import *
    from selector2 import *
    pyfi = 'x = 2'
    toDeclassify = None
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
            toDeclassify = compiler.parseFile(sys.argv[1])
            outFile = sys.argv[1][:-3] + ".s"

        except IOError as e:
            print 'Unable to open %s: %s' % (sys.argv[1], e)
        except:
            pass
    # uq = UniquifyVisitor()
    # ex = ExplicateVisitor()
    # hp = HeapifyVisitor()
    # cl = ClosureVisitor()
    # fl = FlatVisitor()
    # sl = x86Selector()
    print "-"*20 + "DeClassified AST" + "-"*20
    toUnique = DeclassifyVisitor().dispatch(toDeclassify)
    UniquifyVisitor().print_ast(toUnique.node)
    print "-"*20 + "Uniquified AST" + "-"*20
    toExplicate = UniquifyVisitor().dispatch(toUnique)
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
    #for func in ir_list:
    x86Selector().prettyPrint(ir_list, 0)
