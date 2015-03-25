
from uniquify import *
from freeVars2 import *
from pyAST import *
import copy
_debug = False


class HeapifyVisitor(Visitor):
    tmpCount = 0
    heapSet = set()

    # Meta/HelperMethods----------------------------------------------------
    def metaVisit(self, n, toFunc):
        bodyList = []
        belowList = []
        for e in n.nodes:
            (below, body) = self.dispatch(e)
            belowList += below
            bodyList.append(body)
        return belowList, toFunc(bodyList)

    def metaSingleVisit(self, single, toFunc):
        (below, body) = self.dispatch(single)
        return below, toFunc(body)

    def metaVisitexpr(self, n, toFunc):
        return self.metaSingleVisit(n.expr, toFunc)

    def metaVisitAdds(self, n, toFunc):
        (leftBelow, leftBody) = self.dispatch(n.left)
        (rightBelow, rightBody) = self.dispatch(n.right)
        return leftBelow + rightBelow, toFunc(leftBody, rightBody)

    def metaVisitCompares(self, n, toFunc):
        (exprBelow, exprBody) = self.dispatch(n.expr)
        return exprBelow, toFunc(exprBody, n.ops)

    def metaVisitPoly(self, n, toFunc):
        (typBelow, typBody) = self.dispatch(n.typ)
        (argBelow, argBody) = self.dispatch(n.arg)
        return typBelow + argBelow, toFunc(typBody, argBody)

    def metaVisitCalls(self, n, makeNodeFunc):
        bodyList = []
        belowList = []
        (nBelow, nBody) = self.dispatch(n.node)
        for e in n.args:
            (below, body) = self.dispatch(e)
            belowList += below
            bodyList.append(body)
        return belowList + nBelow, makeNodeFunc(nBody, bodyList)

    def getNewArgName(self, name):
        self.tmpCount += 1
        return str(name) + "h_" + str(self.tmpCount)

    def getNewAssign(self, lhs, rhs):
        return Assign([AssName(lhs, 'OP_ASSIGN')], rhs)

    def getNewSubscriptAssign(self, lhs, element, rhs):
        return Assign([Subscript(Name(lhs), 'OP_ASSIGN',
                                 [InjectFrom(Const(0), Const(element))])], rhs)

    # Assign a one element list to lhs.
    def metaAssignInit(self, lhs):
        return self.getNewAssign(lhs, InjectFrom(Const(3), List
        ([InjectFrom(Const(0), Const(0))])))
    def clearReserved(self, items):
        return set(items) - set(reservedFuncs)

    # Visitor Methods-----------------------------------------------------------
    def visitModule(self, n):
        freeVis = FreeVarVisitor()
        freeVis.dispatch(n)
        self.heapSet |= set(freeVis.getHeapSet())
        self.heapSet = self.clearReserved(self.heapSet)
        if _debug == True:
            print self.heapSet
        (free, body) = self.dispatch(n.node)
        fb = set(free) -set(reservedFuncs)
        locs = []
        for var in fb:
            locs.append(self.metaAssignInit(var))
        return Module(None, Stmt(locs + body.nodes))

    def visitLambda(self, n):
        #freeVars
        loosies = FreeVarVisitor().dispatch(n) - set(reservedFuncs)
        # local vars in scope
        localNow = UniquifyVisitor().findLocals(n, 0, False)
        # free vars ins scope
        freeNow = set(loosies) - set(localNow) - set(reservedFuncs)
        self.heapSet |= loosies
        paramsToHeap = set(n.argnames) & self.heapSet  # freeNow
        paramNames = {}
        renamedArgs = copy.copy(n.argnames)

        for arg in set(paramsToHeap):
            argToRename = renamedArgs.index(arg)
            newName = self.getNewArgName(renamedArgs[argToRename])
            paramNames[arg] = newName
            renamedArgs[argToRename] = newName
        paramAllocs = []

        for arg in self.clearReserved(paramsToHeap):
            paramAllocs.append(self.metaAssignInit(arg))
        paramInits = []

        for arg in self.clearReserved(paramsToHeap):
            paramInits.append \
                (self.getNewSubscriptAssign(arg, 0, Name(paramNames[arg])))

        (below, body) = self.dispatch(n.code)
        heapifyNow = (self.heapSet & set(localNow)) - set(n.argnames)
        locInits = []

        for var in self.clearReserved(heapifyNow):
            locInits.append(self.metaAssignInit(var))

        return (list(freeNow),
               Lambda(renamedArgs, n.defaults, n.flags,
                    Stmt(paramAllocs + locInits + paramInits + body.nodes)))

    def visitStmt(self, n):
        bodyList = []
        belowList = []
        for e in n.nodes:
            (below, body) = self.dispatch(e)
            belowList += below
            bodyList.append(body)
        return belowList, Stmt(bodyList)

    def visitName(self, n):
        if n.name in self.heapSet:
            return ([], Subscript(Name(n.name), 'OP_APPLY',
                                  [InjectFrom(Const(0), Const(0))]))
        return [], n

    def visitAssign(self, n):
        (exprBelow, exprBody) = self.dispatch(n.expr)
        if isinstance(n.nodes[0], AssName):
            if n.nodes[0].name in self.heapSet:
                return exprBelow, self.getNewSubscriptAssign(
                    n.nodes[0].name, 0, exprBody)
            else:
                return exprBelow, self.getNewAssign(n.nodes[0].name, exprBody)
        bodyList = []
        belowList = []
        for e in n.nodes:
            (below, body) = self.dispatch(e)
            belowList += below
            bodyList.append(body)
        return exprBelow + belowList, Assign(bodyList, exprBody)

    def visitAssName(self, n):
        pass

    def visitPrintnl(self, n):
        (below, body) = self.dispatch(n.nodes[0])
        return below, Printnl([body], n.dest)

    def visitConst(self, n):
        return [], n

    def visitAdd(self, n):
        return self.metaVisitAdds(n, lambda l, r: Add((l, r)))

    def visitIntAdd(self,n):
        return self.metaVisitAdds(n, lambda l, r: IntAdd((l, r,)))

    def visitBigAdd(self, n):
        return self.metaVisitAdds(n, lambda l, r: BigAdd((l, r)))

    def visitOr(self, n):
        return self.metaVisit(n, lambda nds: Or(nds))

    def visitAnd(self, n):
        return self.metaVisit(n, lambda nds: And(nds))

    def visitList(self, n):
        return self.metaVisit(n, lambda nds: List(nds))



    def visitUnarySub(self, n):
        return self.metaVisitexpr(n, lambda expr: UnarySub(expr))

    def visitNot(self, n):
        return self.metaVisitexpr(n, lambda expr: Not(expr))

    def visitDiscard(self, n):
        return self.metaVisitexpr(n, lambda expr: Discard(expr))

    def visitCompare(self, n):
        return self.metaVisitCompares(
            n, lambda expr, ops: Compare(expr, ops))

    def visitIntCompare(self, n):
        return self.metaVisitCompares(
            n, lambda expr, ops: IntCompare(expr, ops))

    def visitBigCompare(self, n):
        return self.metaVisitCompares(
            n, lambda expr, ops: BigCompare(expr, ops))

    def visitIsCompare(self, n):
        return self.metaVisitCompares(
            n, lambda expr, ops: IsCompare(expr, ops))

    def visitDict(self, n):
        items = []
        itemsBelow = []
        for item in n.items:
            (valBelow, valBody) = self.dispatch(item[0])
            (keyBelow, keyBody) = self.dispatch(item[1])
            items.append((valBody, keyBody))
            itemsBelow += valBelow + keyBelow
        return (itemsBelow, Dict(items))

    def visitSubscript(self, n):
        bodyList = []
        belowList = []
        (exprBelow, exprBody) = self.dispatch(n.expr)
        for e in n.subs:
            (below, body) = self.dispatch(e)
            belowList += below
            bodyList.append(body)
        return (exprBelow + belowList, Subscript(exprBody, n.flags, bodyList))

    def visitReturn(self, n):
        return self.metaSingleVisit(n.value, lambda value: Return(value))

    def visitIfExp(self, n):
        (tstBelow, tstBody) = self.dispatch(n.test)
        (thnBelow, thnBody) = self.dispatch(n.then)
        (elsBelow, elsBody) = self.dispatch(n.else_)
        return tstBelow + thnBelow + elsBelow, IfExp(tstBody, thnBody, elsBody)

    def visitLet(self, n):
        (varBelow, varBody) = self.dispatch(n.var)
        (rBelow, rBody) = self.dispatch(n.rhs)
        (bodyBelow, bodyBody) = self.dispatch(n.body)
        return (varBelow + rBelow + bodyBelow,
                Let(varBody, rBody, bodyBody))

    def visitInjectFrom(self, n):
        return self.metaVisitPoly(n, lambda typ, arg: InjectFrom(typ, arg))

    def visitProjectTo(self, n):
        return self.metaVisitPoly(n, lambda typ, arg: ProjectTo(typ, arg))

    def visitGetTag(self, n):
        return self.metaSingleVisit(n.arg, lambda arg: GetTag(arg))

    def visitCallFunc(self, n):
        if isinstance(n.node, Name) and n.node.name in reservedFuncs:
            bodyList = []
            belowList = []
            for e in n.args:
                (below, body) = self.dispatch(e)
                belowList += below
                bodyList.append(body)
            return belowList, CallFunc(n.node, bodyList)
        return self.metaVisitCalls(n, lambda node, args: CallFunc(node, args))

    def visitIndirectCall(self, n):
        return self.metaVisitCalls(n,
                                   lambda node, args: IndirectCall(node, args))

if __name__ == '__main__':
    import sys
    import compiler
    from uniquify import *
    from explicate2 import *

    pyfi = '2 + 5'

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
    hp = HeapifyVisitor()
    print tree
    tree = uq.preorder(tree, uq, {})
    print tree
    tree = ex.preorder(tree, ex)
    print tree
    tree = hp.preorder(tree, hp)
    print tree

