
from selector2 import *

class x86Selector(x86Selector):

    def visitAssAttr(self, n, args=None):

        pass

    def visitGetattr(self, n, args=None):
        inst = []
        #add our string to .data here
        inst += self.dispatch(n.expr)
        inst.append(x86Push(x86Label(self.toDataStr(n.attrname)))) ############
        inst.append(x86Push(self.getCurrTemp())) #should this be a new temp
        inst.append(x86Call('get_attr'))
        inst.append(x86Add(x86Const(8), x86Register('esp')))
        inst.append(x86Mov(x86Register('eax'), self.getNextTemp()))
        return inst

    def visitHasAttr(self, n, args=None):
        inst = []
        #add our string to .data here
        inst += self.dispatch(n.expr)
        inst.append(x86Push(x86Label(self.toDataStr(n.attrname)))) ############
        inst.append(x86Push(self.getCurrTemp())) #should this be a new temp
        inst.append(x86Call('has_attr'))
        inst.append(x86Add(x86Const(8), x86Register('esp')))
        inst.append(x86Mov(x86Register('eax'), self.getNextTemp()))
        return inst

    def visitCreateClass(self, n, args=None):
        inst = []
        inst += self.dispatch(n.bases)
        inst.append(x86Push(self.getCurrTemp()))
        inst.append(x86Call('create_class'))
        inst.append(x86Add(x86Const(4), x86Register('esp')))
        inst.append(x86Mov(x86Register('eax'), self.getNextTemp()))
        return inst


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


if __name__ == '__main__':
    import sys
    import compiler
    from declassify3 import *
    from explicate3 import *
    from uniquify3 import *
    from heapify3 import *
    from closure3 import *
    from flatten3 import *
    from selector3 import *
    from unstructorFlow import *
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
    x86Ir = []
    for func in flattened:
        x86Ir += x86Selector().dispatch(func)
    ir = FlowStripper().destructure(x86Ir)


    x86Selector().prettyPrint(x86Ir, 0)
    sl = x86Selector()
    sl.prettyPrint(ir,0)
    print sl.dataSection
    # x86Selector().prettyPrint(ir, 0)

