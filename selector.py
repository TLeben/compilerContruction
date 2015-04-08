import cStringIO
from pyAST import *
from tourist import Visitor
from x86AST import *
from uniquify3 import *
import string
import random

regAllocation = False

class x86Selector(Visitor):

    _tmpCounter = 0
    _strCount = 0
    _stkCount = 0
    symTable = {}
    todo = 0
    instList = []
    dataSection = ""

    def __init__(self):
        super(x86Selector, self).__init__()

    # Meths/Helper methods----------------------------------



            #print '~'*15 'with structured flow' + '~' *15
    #x86Selector().prettyPrint(x86Ir, 0)
    def updateSymTable(self, var, val=None):
        if var in self.symTable:
            pass
        else:
            if val:
                self.symTable[var] = val
            else:
                self.symTable[var] = x86Var(var)
        return self.symTable.get(var)

    def getNextTemp(self):
        self._tmpCounter+=1

        return self.updateSymTable(self.getCurrTemp())

    def getCurrTemp(self):
        tmp = "__t" + str(self._tmpCounter)
        return x86Var(tmp)

    def getRandLabel(self, length=6):
        return ''.join(random.choice(
            string.ascii_lowercase +
            string.digits)
                       for _ in range(length))

    def toDataStr(self, strng):
        self._strCount +=1
        strLabel = '.UserStr{}{}:'.format(self._strCount, self.getRandLabel())
        self.dataSection += '\n' + strLabel
        self.dataSection += '\n\t.string \"{}\"'.format(strng)
        return strLabel

    def getNextActivationRec(self):
        pass

    def pushCalleeSaves(self, stkCount):
        inst = []
        for r in calleeSaveRegs:
            stkCount += 4
            inst.append(x86Push(x86Register(r)))
        return inst, stkCount

    def popCalleeSaves(self):
        inst = []
        for r in reversed(calleeSaveRegs):
            inst.append(x86Pop(x86Register(r)))
        return inst

    def prettyPrint(self, inst, indents=0):
        asm = cStringIO.StringIO()
        for i in inst:
            if isinstance(i, x86If):
                print "\t" * indents + "If: " + repr(i.operandList[0])
                self.prettyPrint(i.operandList[1], indents+1)
                print "\t" * indents + "Else:"
                self.prettyPrint(i.operandList[2], indents+1)
                print "\t" * indents + "EndIf"
            elif isinstance(i, x86Preamble):
                print "# preamble"
                self.prettyPrint(i.instructions)
            elif isinstance(i, x86Label):
                print '\t' * indents + repr(i)
            else:
                print "\t" * (indents + 1) + repr(i)


    def assignVar(self, newval):
        if newval.isdigit():
            if newval > self._stkCount:
                self._stkCount = newval
            return x86StkLoc(int(newval)*4)
        else:
            return x86Register(newval)

    def replaceVars(self, env, inst):
        stkCt = 0
        #print env
        for i in inst:
            if isinstance(i, x86OneOpInstruction):
                if isinstance(i.name, x86Var):
                    i.name = self.assignVar(env[repr(i.name)])
                if isinstance(i.op, x86Var):
                    i.op = self.assignVar(env[repr(i.op)])

            elif isinstance(i, x86TwoOpInstruction):
                if isinstance(i.lhs, x86Var):
                    i.lhs = self.assignVar(env[repr(i.lhs)])
                if isinstance(i.rhs, x86Var):
                    i.rhs = self.assignVar(env[repr(i.rhs)])
                # print i.rhs, i.lhs
            elif isinstance(i,x86ThreeOpInstruction):
                if isinstance(i.lhs, x86Var):
                    i.lhs = self.assignVar(env[repr(i.lhs)])
                if isinstance(i.mhs, x86Var):
                    i.mhs = self.assignVar(env[repr(i.mhs)])
                    if isinstance(i.rhs, x86Var):
                        i.rhs = self.assignVar(env[repr(i.rhs)])
        return inst





    # Visitors abstract --------------------------------------------------------

    def visitModule(self, n, args=None):
        # Module attributes
        # doc              doc string, a string or None
        # node             body of the module
        return self.dispatch(n.node)

    # Stmts ::= Stmt Stmts | e
    def visitStmt(self, n, args=None):
        # Stmt attributes
        # nodes
        inst = []
        for d in n:
            inst += self.dispatch(d)
        # self.actRecord.addInstruction(inst)
        return inst

    # Stmt ---------------------------------------------------------------------
    def visitAssign(self, n, args=None):
        # Assign attributes
        # nodes            a list of assignment targets, one per equal sign
        # expr             the value being assigned
        inst = []

        if isinstance(n.nodes[0], AssName): # assign to variable
            inst += self.dispatch(n.expr)
            inst.append(x86Mov(self.getCurrTemp(),
                               self.updateSymTable(n.nodes[0].name)))

        elif isinstance(n.nodes[0], Subscript): # assign subscript
            inst += self.dispatch(n.expr)
            tmp = self.getCurrTemp()
            inst += self.dispatch(n.nodes[0].subs[0])
            subs = self.getCurrTemp()
            inst += self.dispatch(n.nodes[0].expr)
            expr = self.getCurrTemp()
            inst.append(x86Push(tmp))
            inst.append(x86Push(subs))
            inst.append(x86Push(expr))
            inst.append(x86Call('set_subscript'))
            inst.append(x86Add(x86Const(12), x86Register('esp')))

        return inst
    
    def visitDiscard(self, n, args=None):
        return self.dispatch(n.expr)
    
    # Function calls -----------------------------------------------------------
    def visitCallFunc(self, n, args=None):
        inst = []
        for arg in reversed(n.args):
            inst += self.dispatch(arg)
            inst.append(x86Push(self.getNextTemp()))
        inst += self.dispatch(n.node)
        #call*
        inst.append(x86Call(n.node.name))
        inst.append(x86Mov(x86Register('eax'), self.getNextTemp()))
        inst.append(x86Add(x86Const(len(n.args)*4), x86Register('esp')))
        return inst

    def visitPrintnl(self, n, args=None):
        inst = []
        inst += self.dispatch(n.nodes[0])
        inst.append(x86Push(self.getCurrTemp()))
        inst.append(x86Call("print_any"))
        inst.append(x86Add(x86Const(4), x86Register('esp')))

        return inst

    # exprs  -------------------------------------------------------------------
    def visitUnarySub(self, n, args=None):
        inst = []
        inst += self.dispatch(n.expr)
        inst.append(x86Neg(self.getCurrTemp()))
        return inst

    # leaves -------------------------------------------------------------------
    def visitConst(self, n, args=None):
        return [x86Mov(x86Const(n.value), self.getNextTemp())]

    def visitName(self, n, args=None):
        if n.name == FALSE:
            return [x86Mov(x86Const(FALSEVAL), self.getNextTemp())]
        elif n.name == TRUE:
            return [x86Mov(x86Const(TRUEVAL), self.getNextTemp())]
        else:
            return [x86Mov(n.name, self.getNextTemp())]






