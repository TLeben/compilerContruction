from compiler import *
from pyAST import *
from tourist import *
import copy


class UniquifyVisitor(Visitor):
    varCount = 0

    def uniquify(self, symTable, name):
        if symTable.has_key(name):
            return symTable[name]
        else:
            return name

    def uniquifyLocals(self, locals, symTable):
        for v in locals:
            symTable[v] = '__{}{}'.format(v, self.varCount)
            self.varCount += 1

    def print_ast(self, stmts, tab=0):
        for n in stmts.nodes:
            if isinstance(n, If):
                print '\t' * tab + 'If: ' + str(n.tests[0][0]) + ' then:'
                self.print_ast(n.tests[0][1], tab+1)
                print '\t' * (tab) + 'Else: '
                self.print_ast(n.else_, tab+1)
                print '\t' * (tab) + 'End If'
            elif isinstance(n, While):
                print '\t' * tab + 'While: ' + str(n.test) + ' then:'
                self.print_ast(n.body, tab+1)
                print '\t' * (tab) + 'End While'
            elif isinstance(n, Lambda):
                print '\t' * tab + 'Lambda (' + str(n.argnames) + '):'
                self.print_ast(Stmt([n.code]), tab+1)
                print '\t' * tab + 'EndLambda'
            elif isinstance(n, Function):
                print '\t' * tab + 'def ' + str(n.name) + '(' + str(n.argnames) + '):'
                self.print_ast(n.code, tab+1)
                print '\t' * tab + 'EndFunc'
            else:
                print '\t' * (tab) + str(n)

    def findLocals(self, n, depth=0, thisScope=True):
        lVars = []

        if isinstance(n, Assign):
            if isinstance(n.nodes[0], AssName):
                lVars += [n.nodes[0].name]
            elif isinstance(n.nodes[0], AssAttr):
                if isinstance(n.nodes[0].expr, Name):
                    lVars += [n.nodes[0].expr.name]
                else:
                    lVars += self.findLocals(n.nodes[0].expr, depth + 1)
            elif isinstance(n.nodes[0], Name):
                lVars += [n.nodes[0].name]
            elif isinstance(n.nodes[0], Subscript):
                lVars += self.findLocals(n.expr, depth + 1)
                lVars += self.findLocals(n.nodes[0].expr, depth + 1)
                lVars += self.findLocals(n.nodes[0].subs, depth + 1)

            return lVars

        elif isinstance(n, Function):
            lVars += [n.name]
            lVars += n.argnames
            d = depth + 1
            for stmt in n.code.nodes:
                lVars += self.findLocals(stmt, d)

            return lVars

        elif isinstance(n, Lambda):
            if not thisScope:
                return []
            if isinstance(n.code, Stmt):
                d = depth + 1
                for stmt in n.code.nodes:
                    lVars += self.findLocals(stmt, d)
            else:
                lVars += self.findLocals(n.code, depth + 1)
            lVars += n.argnames

            return lVars

        elif isinstance(n, Module):
            d = depth + 1
            for stmt in n.node.nodes:

                lVars += self.findLocals(stmt, d)
            return lVars

        elif isinstance(n, IfExp):
            lVars += self.findLocals(n.test, depth + 1)
            lVars += self.findLocals(n.then, depth + 1)
            lVars += self.findLocals(n.else_, depth + 1)

            return lVars

        elif isinstance(n, If):
            lVars += self.findLocals(n.tests[0][0], depth + 1)
            d = depth + 1
            for stmt in n.tests[0][1]:
                lVars += self.findLocals(stmt, d)
            for stmt in n.else_:
                lVars += self.findLocals(stmt, d)

            return lVars

        elif isinstance(n, While):
            lVars += self.findLocals(n.test, depth + 1)
            d = depth + 1
            for stmt in n.body:
                lVars += self.findLocals(stmt, d)

        elif isinstance(n, And) or isinstance(n, Or):
            lVars += self.findLocals(n.nodes[0], depth + 1)
            lVars += self.findLocals(n.nodes[1], depth + 1)

            return lVars
       # elif isinstance(n, Discard):
            #for ex in n:
                #if isinstance(ex, Name):
                    #lVars += ex.name
                #else:
                    #lVars += self.findLocals(ex, depth + 1)
            #return[]

        elif isinstance(n, Return):

            #print n.value
            #return self.findLocals(n.value)
            return []
        else:
            return []
        # Visitor Functions

    def visitLambda(self, n, symTable):
        locVars = self.findLocals(n)
        self.uniquifyLocals(locVars, symTable)
        n.localVars = [symTable[val] for val in locVars]
        n.code = self.dispatch(n.code, copy.deepcopy(symTable))
        args = []
        for arg in n.argnames:
            args += [self.uniquify(symTable, arg)]
        n.argnames = args
        return n

    def visitFunction(self, n, symTable):
        print symTable
        n.name = self.uniquify(symTable, n.name)
        locVars = self.findLocals(n)
        self.uniquifyLocals(locVars, symTable)
        n.localVars = [symTable[val] for val in locVars]
        stmts = []
        for node in n.code.nodes:
            stmts += [self.dispatch(node, copy.deepcopy(symTable))]
        n.code.nodes = stmts
        args = []
        for arg in n.argnames:
            args += [self.uniquify(symTable, arg)]
        n.argnames = args
        return n

    def visitModule(self, n, symTable = {}):
        locVars = self.findLocals(n)
        self.uniquifyLocals(locVars, symTable)
        n.localVars = [symTable[val] for val in locVars]
        stmts = []
        for n in n.node:
            stmts += [self.dispatch(n, copy.deepcopy(symTable))]
        n.node = stmts
        return Module(None, Stmt(n.node))

    def visitStmt(self, n, symTable):
        stmts = []
        for nd in n.nodes:
            stmts.append(self.dispatch(nd, symTable))
        return Stmt(stmts)

    def visitName(self, n, symTable):
        if not (n.name == 'True' or n.name == 'False'):
            n.name = self.uniquify(symTable, n.name)
        return n

    def visitAssName(self, n, symTable):
        n.name = self.uniquify(symTable, n.name)
        return n

    def visitConst(self, n, symTable):
        return n

    def visitReturn(self, n, symTable):
        n.value = self.dispatch(n.value, symTable)
        return n

    def visitIfExp(self, n, symTable):
        n.test = self.dispatch(n.test, symTable)
        n.then = self.dispatch(n.then, symTable)
        n.else_ = self.dispatch(n.else_, symTable)
        return n

    def visitUnarySub(self, n, symTable):
        n.expr = self.dispatch(n.expr, symTable)
        return n

    def visitAdd(self, n, symTable):
        n.left = self.dispatch(n.left, symTable)
        n.right = self.dispatch(n.right, symTable)
        return n

    def visitDiscard(self, n, symTable):
        n.expr = self.dispatch(n.expr, symTable)
        return n

    def visitPrintnl(self, n, symTable):
        n.nodes[0] = self.dispatch(n.nodes[0], symTable)
        return n

    def visitAnd(self, n, symTable):
        for e in n.nodes:
            self.dispatch(e, symTable)
        return n

    def visitOr(self, n, symTable):
        for e in n.nodes:
            self.dispatch(e, symTable)
        return n

    def visitNot(self, n, symTable):
        n.expr = self.dispatch(n.expr, symTable)
        return n

    def visitList(self, n, symTable):
        for e in n.nodes:
            self.dispatch(e, symTable)
        return n

    def visitDict(self, n, symTable):
        for e in n.items:
            (self.dispatch(e[0], symTable), self.dispatch(e[1], symTable))
        return n

    def visitSubscript(self, n, symTable):
        n.expr = self.dispatch(n.expr, symTable)
        subs = []
        for e in n.subs:
            subs += [self.dispatch(e, symTable)]
        n.subs = subs
        return n

    def visitCompare(self, n, symTable):
        n.expr = self.dispatch(n.expr, symTable)
        n.ops[0] = (n.ops[0][0], self.dispatch(n.ops[0][1], symTable))
        return n

    def visitCallFunc(self, n, symTable):
        if isinstance(n.node, Name) and n.node.name == 'input':
            return n
        n.node = self.dispatch(n.node, symTable)
        for e in n.args:
            self.dispatch(e, symTable)
        return n

    def visitAssign(self, n, symTable):
        n.nodes[0] = self.dispatch(n.nodes[0], symTable)
        n.expr = self.dispatch(n.expr, symTable)
        return n



if __name__ == '__main__':
    import sys
    import compiler
    from explicate2 import *
    pyfi = '''x = 5 + 5 + 3
           '''

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
    visitor = UniquifyVisitor()
    print tree
    print visitor.preorder(tree, visitor, {})