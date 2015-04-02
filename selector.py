from pyAST import *
from tourist import Visitor
from x86AST import *
from uniquify3 import *

regAllocation = False

class x86Selector(Visitor):

    _tmpCounter = 0
    symTable = {}
    todo = 1
    instList = []

    def __init__(self):
        super(x86Selector, self).__init__()

    # Mets/Helper methods----------------------------------

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
        return self.getCurrTemp()

    def getCurrTemp(self):
        tmp = "__t" + str(self._tmpCounter)
        return x86Var(tmp)

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
        if getattr(n, 'tailcall', False):
            # callFun = n.expr
            #
            # actRecOffset = (len(callFun.args)) - n.callerArgNum *4
            #
            #
            #
            #
            #
            #
            print 'tailCall-------------------------------------------------------------------------'
            pass####################################################3
            # #save eip and ebp and restore to correct place if necessary.
				# newFrameOffset = (len(ast.expr.args) - ast.callerArgNum) * 4
				# if newFrameOffset != 0:
				# 	frameAdjTmpVar = self.makeTmpVar()
				# 	myIRList.append(x86.Movl(x86.MemLoc(0), frameAdjTmpVar)) #save previous ebp
				# 	myIRList.append(x86.Movl(frameAdjTmpVar, x86.MemLoc(newFrameOffset)))
				# 	myIRList.append(x86.Movl(x86.MemLoc(4), frameAdjTmpVar)) #save previous eip
				# 	myIRList.append(x86.Movl(frameAdjTmpVar, x86.MemLoc(newFrameOffset+4)))
				# 	myIRList.append(x86.Addl(x86.ConstNode(newFrameOffset),x86.Register('ebp')))
            #
				# #handle arguments
				# counter = 8
				# for arg in ast.expr.args:
				# 	myIRList += self.generate_x86_code(arg)
				# 	myIRList.append(x86.Movl(self.getTmpVar(),x86.MemLoc(counter)))
				# 	counter += 4
				# #jump to tailcall-ee (after the frame realloc)
				# myIRList += self.generate_x86_code(ast.expr.node)
				# myIRList.append(x86.Movl(self.getTmpVar(),x86.Register('eax')))
				# #restore callee save registers
				# for register in reversed(self._calleeSaveRegisters):
				# 	myIRList.append(x86.Popl(register))
				# myIRList.append(x86.Movl(x86.Register('ebp'), x86.Register('esp')))
				# myIRList.append(x86.Addl(x86.ConstNode(3), x86.Register('eax')))
				# myIRList.append(x86.JmpStar(x86.Register('eax')))
				# return myIRList
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






