
from selector2 import *

class x86Selector(x86Selector):

    def doPass(self, ast,  debug=0):
        ir = []
        if debug:
            print '-'*20 + self.__class__.__name__  + '-' *20
        for inst in ast:
            ir += x86Selector().dispatch(inst)
        if debug:
            self.prettyPrint(ir, 0)
        return ir

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
    debug = 10
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
            if debug:
                print "-"*20 + "Parsed AST" + "-"*20
            toDeclassify = compiler.parseFile(sys.argv[1])
            if debug:
                print toDeclassify
            outFile = sys.argv[1][:-3] + ".s"

        except IOError as e:
            print 'Unable to open %s: %s' % (sys.argv[1], e)
        except:
            pass

    toUnique = DeclassifyVisitor().doPass(toDeclassify, debug)

    toExplicate = UniquifyVisitor().doPass(toUnique, debug)

    toHeapify = ExplicateVisitor().doPass(toExplicate, debug)

    toClosure = HeapifyVisitor().doPass(toHeapify, debug)

    toFlatten = ClosureVisitor().doPass(toClosure, debug)

    toSelector = FlatVisitor().doPass(toFlatten, debug)

    toRemoveFlow = x86Selector().doPass(toSelector, debug)

    unFlowed = FlowStripper().doPass(toRemoveFlow, debug)



