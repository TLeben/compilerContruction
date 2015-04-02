from tourist import *
from uniquify3 import *
from pyAST import *
from freeVars2 import *


class ClosureVisitor(Visitor):

    gFuncCounter = 0
    freeVarsCounter = 0
    tmpVar = 0
    # Meta/Helper methods ------------------------------------------------------

    def getGlobalName(self):
        self.gFuncCounter += 1
        return "lambda" + str(self.gFuncCounter)

    def getFreeVarsName(self):
        self.freeVarsCounter += 1
        return "freeVars" + str(self.freeVarsCounter)

    def getTmpVar(self):
        self.tmpVar += 1
        return "closure" + str(self.tmpVar)

    def metaMainFunc(self, funcList, mainTree):
        return funcList + [Function(None, Name('_main'), [], None, 0, None,
                            Stmt(mainTree.node.nodes + [Return(Const(0))]))]

    # Visitor Methods-----------------------------------------------------------

    def visitModule(self, n, args=None):
        (body, funcs) = self.dispatch(n.node)
        return Module(n.doc, body), funcs

    def visitStmt(self, n, args=None):
        nList = []
        fList = []
        for element in n.nodes:
            (stmt, funcs) = self.dispatch(element)
            nList.append(stmt)
            fList += funcs
        return Stmt(nList), fList

    def visitLambda(self, n, args=None):
        (body, funcs) = self.dispatch(n.code)
        # Get the freeVars. Needed to create closure.
        freeVs = FreeVarVisitor().dispatch(n) - set(reservedFuncs)
        freeVs = [Name(v) for v in freeVs]
        globalName = self.getGlobalName() # name out lambda
        # Create function definition
        # TODO: Put freevar code in 'newCodeHeader' after we implement heapify
        freeVName = self.getFreeVarsName()
        header = []
        offset = 0
        for v in freeVs:
            header.append(Assign([AssName(v.name, 'OP_ASSIGN')],
                                        Subscript(Name(freeVName),
                                                  'OP_APPLY', [
                                                InjectFrom(Const(0), Const(
                                                    offset))])))
            offset += 1
        code = body.nodes
        defFunc = Function(None, Name(globalName),
                             [freeVName] + n.argnames, n.defaults,
                             n.flags, None, Stmt(header + code))
        return (
            Closure(Name(globalName), InjectFrom(Const(3), List(freeVs))),
            funcs + [defFunc])

    def visitCallFunc(self, n, args=None):
        if isinstance(n.node, Name) and (n.node.name in reservedFuncs):
            return n, []
        (body, funcs) = self.dispatch(n.node)
        bArgs = []
        fArgs = []
        for arg in n.args:
            (body2, funcs2) = self.dispatch(arg)
            bArgs += [body2]
            fArgs += funcs2
        # TODO: Populate this list once we get heapify working
        tmpV = Name(self.getTmpVar())
        letNode = Let(tmpV, body, IndirectCall(GetFunPtr(tmpV),
                                                       List([GetFreeVars(
                                                           tmpV)] + bArgs)))
        return letNode, fArgs + funcs

    def visitPrintnl(self, n, args=None):
        (body, funcs) = self.dispatch(n.nodes[0])
        return (Printnl([body], n.dest), funcs)

    def visitConst(self, n, args=None):
        return (n, [])

    def visitName(self, n, args=None):
        return n, []

    def visitAssign(self, n, args=None):
        bList = []
        fList = []
        for element in n.nodes:
            (body, funcs) = self.dispatch(element)
            bList += [body]
            fList += funcs
        (bExpr, fExpr) = self.dispatch(n.expr)
        return Assign(bList, bExpr), fList + fExpr

    def visitAssName(self, n, args=None):
        return n, []

    def visitUnarySub(self, n, args=None):
        (body, funcs) = self.dispatch(n.expr)
        return UnarySub(body), funcs

    def visitOr(self, n, args=None):
        bList = []
        fList = []
        for node in n.nodes:
            (body, funcs) = self.dispatch(node)
            bList += [body]
            fList += funcs
        return Or(bList), fList

    def visitAnd(self, n, args=None):
        bList = []
        fList = []
        for node in n.nodes:
            (body, funcs) = self.dispatch(node)
            bList += [body]
            fList += funcs
        return And(bList), fList

    def visitNot(self, n, args=None):
        (body, funcs) = self.dispatch(n.expr)
        return Not(body), funcs

    def visitCompare(self, n, args=None):
        (bExpr, fExpr) = self.dispatch(n.expr)
        (bOps, fOps) = self.dispatch(n.ops[0][1])
        return Compare(bExpr, [(n.ops[0][0], bOps)]), fExpr + fOps

    def visitIsCompare(self, n, args=None):
        (bExpr, fExpr) = self.dispatch(n.expr)
        (bOps, fOps) = self.dispatch(n.ops[1])###
        return IsCompare(bExpr, [(n.ops[0][0], bOps)]), fExpr + fOps

    def visitIntCompare(self, n, args=None):
        (bExpr, fExpr) = self.dispatch(n.expr)
        (bOps, fOps) = self.dispatch(n.ops[1])###
        return IntCompare(bExpr, [(n.ops[0][0], bOps)]), fExpr + fOps

    def visitBigCompare(self, n, args=None):
        (bExpr, fExpr) = self.dispatch(n.expr)
        (bOps, fOps) = self.dispatch(n.ops[1])###
        return BigCompare(bExpr, [(n.ops[0][0], bOps)]), fExpr + fOps

    def visitIfExp(self, n, args=None):
        (bTest, fTest) = self.dispatch(n.test)
        (bThen, fThen) = self.dispatch(n.then)
        (bElse_, fElse_) = self.dispatch(n.else_)
        return IfExp(bTest, bThen, bElse_), fTest + fThen + fElse_

    def visitList(self, n, args=None):
        bList = []
        fList = []
        for node in n.nodes:
            (body, funcs) = self.dispatch(node)
            bList += [body]
            fList += funcs
        return List(bList), fList

    def visitDict(self, n, args=None):
        items = []
        iList = []
        for (k, v) in n.items:
            (key, keyList) = self.dispatch(k)
            (val, valList) = self.dispatch(v)
            items.append((key, val))
            iList.extend(keyList + valList)
        return Dict(items), iList

    def visitSubscript(self, n, args=None):
        (expr, exprList) = self.dispatch(n.expr)
        (sub, subList) = self.dispatch(n.subs[0])
        return Subscript(expr, n.flags, [sub]), exprList + subList

    def visitReturn(self, n, args=None):
        (val, funcs) = self.dispatch(n.value)
        return Return(val), funcs

    def visitLet(self, n, args=None):
        (var, vFuncs) = self.dispatch(n.var)
        (rhs, rFuncs) = self.dispatch(n.rhs)
        (body, bFuncs) = self.dispatch(n.body)
        return Let(var, rhs, body), vFuncs + rFuncs + bFuncs

    def visitInjectFrom(self, n, args=None):
        (arg, fArgs) = self.dispatch(n.arg)
        (typ, fTyps) = self.dispatch(n.typ)
        return InjectFrom(typ, arg), fArgs + fTyps

    def visitProjectTo(self, n, args=None):
        (arg, fArgs) = self.dispatch(n.arg)
        (typ, fTyps) = self.dispatch(n.typ)
        return ProjectTo(typ, arg), fArgs + fTyps

    def visitGetTag(self, n, args=None):
        (arg, fArgs) = self.dispatch(n.arg)
        return GetTag(arg), fArgs

    def visitDiscard(self, n, args=None):
        (expr, fExprs) = self.dispatch(n.expr)
        return Discard(expr), fExprs

    def visitBigAdd(self, n, args=None):
        (left, fLefts) = self.dispatch(n.left)
        (right, fRights) = self.dispatch(n.right)
        return BigAdd((left, right)), fLefts + fRights

    def visitIntAdd(self, n, args=None):
        (left, fLefts) = self.dispatch(n.left)
        (right, fRights) = self.dispatch(n.right)
        return IntAdd((left, right)), fLefts + fRights


    def doClosure(self, tree):
        (mainTree, functionList) = self.dispatch(tree)
        return self.metaMainFunc(functionList, mainTree)


if __name__ == '__main__':
    import sys
    import compiler
    from explicate2 import *
    from uniquify import *
    from heapify2 import *
    from flatten2 import *
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
    cl = ClosureVisitor()
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

    tree = cl.doClosure(tree)
    print tree
    print '\nclosure ...........................[pass]\n'

    tree = fl.preorder(tree, fl)
    print tree
    print '\nflatten ...........................[pass]\n'

