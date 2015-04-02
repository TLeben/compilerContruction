from pyAST import *
from tourist import *


class DeclassifyVisitor(Visitor):

    # Helper methods -----------------------------------------------------------
    _tmpCounter = 0
    _methCounter = 0
    def getNextTemp(self):
        self._tmpCounter+=1
        return self.getCurrTemp()

    def getCurrTemp(self):
        tmp = "__dc" + str(self._tmpCounter)
        return tmp

    def getNextMeth(self):
        self._tmpCounter += 1
        return self.getCurrMeth()

    def getCurrMeth(self):
        return "__methDc" + str(self._methCounter)



    # p0 Visitor Methods ----------------------------------------------------------

    def visitModule(self, n, thisClass=None):
        return Module(n.doc, self.dispatch(n.node, None))

    # Stmts ::= Stmt Stmts | e
    def visitStmt(self, n, thisClass=None):
        stmtList = []
        print '$'*50
        print n, '\n'
        for child in n.nodes:
            c = self.dispatch(child, thisClass)
            if isinstance(c, List):
                stmtList += c
            else:
                stmtList.append(c)
        return Stmt(stmtList)

    def visitAssign(self, n, thisClass=None):
        self.dispatch(n.expr,thisClass)
        if isinstance(n.nodes[0], AssAttr):
            #assign our attribute, in or out of class scope
            return Assign([
                AssAttr(n.nodes[0].expr, n.nodes[0].attrname, n.nodes[0].flags)],
                          self.dispatch(n.expr, thisClass))
        elif thisClass: # we are in thisClass scope
            assignAttr = n.nodes[0]
            return Assign([
                AssAttr(Name(thisClass), n.nodes[0].name, n.nodes[0].flags)],
                          self.dispatch(n.expr, thisClass))
        else:
            return Assign(n.nodes, self.dispatch(n.expr, thisClass))

    def visitDiscard(self, n, thisClass=None):
        return Discard(self.dispatch(n.expr, thisClass))

    def visitPrintnl(self, n, thisClass=None):
        return Printnl([self.dispatch(n.nodes[0], thisClass)], n.dest)

    def visitCallFunc(self, n, thisClass=None):
        argList = []
        for arg in n.thisClass:
            if isinstance(arg, List):
                argList += arg
            else:
                argList.append(arg)

        return CallFunc(self.dispatch(n.node, thisClass), argList)

    def visitIfExp(self, n, thisClass=None):
        test = self.dispatch(n.test, thisClass)
        then = self.dispatch(n.then, thisClass)
        else_ = self.dispatch(n.else_, thisClass)

        return IfExp(test, then, else_)

    def visitAdd(self, n, thisClass=None):
        right = self.dispatch(n.right, thisClass)
        left = self.dispatch(n.left, thisClass)
        return Add((left, right))

    def visitUnarySub(self, node, thisClass=None):
       return UnarySub(self.dispatch(node.expr, thisClass))

    def visitAssName(self, n, thisClass=None):
        return AssName(self.dispatch(n.name, thisClass), n.flags)

    def visitConst(self, n, thisClass=None):
        return n

    def visitName(self, n, thisClass=None):
        if thisClass:  # check for attribute before we get it
            return IfExp(HasAttr(Name(thisClass), n.name),
                         Getattr(Name(thisClass), n.name), n)
        else:
            return n
    # p1 Visitor Methods --------------------------------------------------------

    def visitCompare(self, n, thisClass=None):
        return Compare(self.dispatch(n.expr, thisClass),
                       self.dispatch(n.ops[0][1], thisClass))

    def visitAnd(self, n, thisClass=None):
        ands = []
        for e in n.nodes:
            toAdd = self.dispatch(e, thisClass)
            if isinstance(toAdd, List):
                ands += toAdd
            else:
                ands.append(toAdd)
        return And(ands)

    def visitOr(self, n, thisClass=None):
        ors = []
        for e in n.nodes:
            toAdd = self.dispatch(e, thisClass)
            if isinstance(toAdd, List):
                ors += toAdd
            else:
                ors.append(toAdd)
        return Or(ors)

    def visitNot(self, n, thisClass=None):
        return Not(self.dispatch(n.expr, thisClass))

    def visitSubscript(self, n, thisClass=None):
        return Subscript(self.dispatch(n.expr, thisClass), n.flags,
                         self.dispatch(n.subs, thisClass))

    def visitList(self, n, thisClass=None):
        lsts = []
        for e in n.nodes:
            toAdd = self.dispatch(e, thisClass)
            if isinstance(toAdd, List):
                lsts += toAdd
            else:
                lsts.append(toAdd)
        return List(lsts)

    def visitDict(self, n, thisClass=None):
        itemList = []
        for e in n.items:
            itemList.append((self.dispatch(e[0], thisClass),
                             self.dispatch(e[1], thisClass)))
        return Dict(itemList)

   # p2 Visitor Methods --------------------------------------------------------
    def visitFunction(self, n, thisClass=None):

        if thisClass:  # in class so assign attributes
            funcName = self.getNextMeth()
            return [Function(n.decorators, funcName, n.argnames, n.defaults,
                        n.flags, n.doc, self.dispatch(n.code, thisClass)),
                    Assign([AssAttr(Name(thisClass), n.name, 'OP_ASSIGN')],
                           Name(funcName))]
        else:
            return Function(n.decorators, n.name, n.argnames, n.defaults,
                        n.flags, n.doc, self.dispatch(n.code, thisClass))


    def visitLambda(self, n, thisClass=None):
        return Lambda(n.argnames, n.defaults, n.flags,
                      self.dispatch(n.code, thisClass))

    def visitReturn(self, n, thisClass=None):
        return Return(self.dispatch(n.value), thisClass)

    # p3 Visitor Methods -------------------------------------------------------
    def visitIf(self, n, thisClass=None):
        test = self.dispatch(n.test[0][0], thisClass)
        then = self.dispatch(n.then[0][1], thisClass)
        else_ = self.dispatch(n.else_, thisClass)
        return If([(test, then)], else_)

    def visitWhile(self, n, thisClass=None):
        return While(self.dispatch(n.test, thisClass),
                     self.dispatch(n.body, thisClass),
                     None)

    def visitClass(self, n, thisClass=None):
        newClass = []
        classAlias = self.getNextTemp()
        a = Assign([AssName(classAlias, 'OP_ASSIGN')], CreateClass(n.bases))
        b = self.dispatch(n.code, classAlias)
        c = Assign([AssName(n.name, 'OP_ASSIGN')], Name(classAlias))
        # newClass.append(Assign([AssName(classAlias, 'OP_ASSIGN')],
        #                   CreateClass(n.bases)))
        # newClass.append(self.dispatch(n.code, classAlias).nodes)
        # newClass.append(Assign([AssName(n.name, 'OP_ASSIGN')],
        #                        Name(classAlias)))
        #return newClass
        print '='*50
        print n.code
        print b
        return [a] + b.nodes + [c]

    def visitGetattr(self, n, thisClass=None):
        return Getattr(self.dispatch(n.expr, thisClass))

    # def visitAssAttr(self, n, thisClass=None):
    #   handled in visitName
    #     pass

    # def visitHasAttr(self, n, thisClass=None):
    #   not need bc user define this node
    #     pass
