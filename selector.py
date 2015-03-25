from pyAST import *
from tourist import Visitor
from x86AST import *

regAllocation = False

class x86Selector(Visitor):

    _tmpCounter = 0
    symTable = {}
    todo = 1
    instList = []
    def __init__(self):
        super(x86Selector, self).__init__()

    # Helper methods----------------------------------

    def getNextTemp(self):
        self._tmpCounter += 1
        tmp = x86Var("___t" + str(self._tmpCounter))
        # if regAllocation:
        #     self.symTable[val] = x86Var("___t" + str(self._tmpCounter))
        # else:
        #     self.symTable[val] = x86StkLoc(self._tmpCounter * 4)
        return tmp

    def getCurrTemp(self):
        tmp = "___t" + str(self._tmpCounter)
        return x86Var(tmp)

    def visitModule(self, n, args=None):
        # Module attributes
        # doc              doc string, a string or None
        # node             body of the module
        instList = self.dispatch(n.node)
        return instList

    # Stmts ::= Stmt Stmts | e
    def visitStmt(self, n, args=None):
        # Stmt attributes
        # nodes
        inst = []
        for d in n.nodes:
            inst += self.dispatch(d)
        return inst
    
    def visitAssign(self, n, args=None):
        # Assign attributes
        # nodes            a list of assignment targets, one per equal sign
        # expr             the value being assigned
        # left = expr
        inst = []
        inst += self.dispatch(n.expr)
        inst += x86Mov()
        return inst
    
    def visitDiscard(self, n, args=None):
        pass
    
    def visitPrintnl(self, n, args=None):
        inst = []
        inst += self.dispatch(n.nodes[0])
        inst.append(x86Push(self.getCurrTemp()))
        inst.append(x86Call("print_any"))
        inst.append(x86Add(x86Const(4), x86Register('esp')))
        return inst

    def visitCallFunc(self, n, args=None):
        pass
    
    def visitIntAdd(self, n, args=None):
        pass
    
    def visitBigAdd(self, n, args=None):
        pass

    def visitUnarySub(self, n, args=None):
        pass

    def visitAssName(self, n, args=None):
        pass

    def visitConst(self, n, args=None):
        return [x86Mov(x86Const(n.value), self.getNextTemp())]

    def visitName(self, n, args=None):
        if n.name == FALSE:
            return [x86Mov(x86Const(FALSEVAL), self.getNextTemp())]
        elif n.name == TRUE:
            return [x86Mov(x86Const(TRUEVAL), self.getNextTemp())]
        else:
            return [x86Mov(n.name, self.getNextTemp())]

 
    
    
    
    def visit(self, n, args=None):
        pass

    def visit(self, n, args=None):
        pass
    
    def visit(self, n, args=None):
        pass
    
    def visit(self, n, args=None):
        pass

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
    tree = fl.preorder(tree, fl)
    print 'flatten ...........................[pass]'
    iList = sl.preorder(tree, sl)
    print 'selector ..........................[pass]'
    for inst in iList:
        print inst


