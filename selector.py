from compiler.ast import *
from tourist import Visitor
from x86AST import *

class x86Selector(Visitor):

    _tmpCounter = 0

    todo = 1
    instList = []
    def __init__(self):
        super(x86Selector, self).__init__()

    # Helper methods----------------------------------

    def getNextTemp(self):
        self._tmpCounter += 1
        tmp = "___sel" + str(self._tmpCounter)
        return tmp

    def getCurrTemp(self):
        tmp = "___sel" + str(self._tmpCounter)
        return tmp


    def toX86(self, n):
        if isinstance(n, Module):
            self.instList += self.toX86(n.node)
            return self.instList
        elif isinstance(n,Stmt):
            inst = []
            for d in n.nodes:
                inst += self.toX86(d)
            return inst
        elif isinstance(n,Assign):
            self.instList += self.toX86(n.expr)
            self.instList += x86Mov()
        elif isinstance(n,AssName):
            self.instList += []
        elif isinstance(n, Printnl):
            inst = []
            inst += self.toX86(n.nodes[0])
            inst.append(x86Push(self.getCurrTemp()))
            inst.append(x86Call("print_any"))
            inst.append(x86Add(x86Const(4), x86Register('esp')))
            return inst
        elif isinstance(n,IntAdd):
            pass
        elif isinstance(n,BigAdd):
            pass
        elif isinstance(n,And):
            pass
        elif isinstance(n,Or):
            pass
        elif isinstance(n,Not):
            pass
        elif isinstance(n,IntCompare):
            pass
        elif isinstance(n,BigCompare):
            pass
        elif isinstance(n,IsCompare):
            pass
        elif isinstance(n,List):
            pass
        elif isinstance(n,Const):
            return [x86Mov(x86Const(n.value), self.getNextTemp())]
        elif isinstance(n,Name):
            if n.name == FALSE:
                return [x86Mov(x86Const(FALSEVAL), self.getNextTemp() )]
            elif n.name == TRUE:
                return [x86Mov(x86Const(TRUEVAL), self.getNextTemp())]
            else:
                return [x86Mov(n.name, self.getNextTemp())]




if __name__ == '__main__':
    import sys
    import compiler
    from explicate2 import *
    from uniquify import *
    from heapify2 import *
    from flatten2 import *
    pyfi = 'print 2'

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
    sl = x86Selector()
    #print tree
    '''tree = uq.preorder(tree, uq, {})
    print 'uniquify ......................... [pass]'
    tree = ex.preorder(tree, ex)
    print 'explicate .........................[pass]'
    tree = hp.preorder(tree, hp)
    print 'heapify ...........................[pass]'
    '''
    tree = fl.preorder(tree, fl, True)
    print tree
    print 'flatten ...........................[pass]'
    code = sl.toX86(tree)
    print 'selector ..........................[pass]'
    for i in code:
        print i


