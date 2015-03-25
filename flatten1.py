
from flatten import *

class FlatVisitor(FlatVisitor):

    def __init__(self):
        super(FlatVisitor, self).__init__()

    def visitLet(self, node, args=None):
        (right, sList) = self.dispatch(node.rhs)
        assn = Assign([AssName(node.var.name, 'OP_ASSIGN')], right)
        (body, sbList) = self.dispatch(node.body)
        return body, sList + [assn] + sbList

    def visitIsCompare(self, n, args=None):
        (expr, sList) = self.dispatch(n.expr)
        (ops, opsList) = self.dispatch(n.ops[1])
        tmp = self.getNextTemp()
        assn = Assign([AssName(tmp, 'OP_ASSIGN')],
                      IsCompare(expr, [(n.ops[0][0], ops)]))
        return Name(tmp), sList + opsList + [assn]

    def visitIntCompare(self, n, args=None):

        (expr, sList) = self.dispatch(n.expr)
        (ops, opsList) = self.dispatch(n.ops[1]) #####
        tmp = self.getNextTemp()
        assn = Assign([AssName(tmp, 'OP_ASSIGN')],
                      IntCompare(expr, [(n.ops[0][0], ops)]))
        return Name(tmp), sList + opsList + [assn]

    def visitBigCompare(self, n, args=None):
        (expr, sList) = self.dispatch(n.expr)
        (ops, opsList) = self.dispatch(n.ops[1])
        tmp = self.getNextTemp()
        assn = Assign([AssName(tmp, 'OP_ASSIGN')],
                      BigCompare(expr, [(n.ops[0][0], ops)]))
        return Name(tmp), sList + opsList + [assn]

    # Adds ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    def visitIntAdd(self, n, args=None):
        (left, stmtL)  = self.dispatch(n.left)
        (right, stmtR) = self.dispatch(n.right)
        tmp = self.getNextTemp()
        assn = Assign([AssName(tmp, 'OP_ASSIGN')], IntAdd((left, right)))
        return Name(tmp), stmtL + stmtR + [assn]

    def visitBigAdd(self, n, args=None):
        (left, stmtL)  = self.dispatch(n.left)
        (right, stmtR) = self.dispatch(n.right)
        tmp = self.getNextTemp()
        bigAss = Assign([AssName(tmp, 'OP_ASSIGN')], BigAdd((left, right)))
        return Name(tmp), stmtL + stmtR + [bigAss]

    # Logical operators~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    def visitAnd(self, n, args=None):
        flatTups = []
        for exp in n.nodes:
            flatTups.append(self.visit(exp))
        tmp = self.getNextTemp()
        assn = Assign([AssName(tmp, 'OP_ASSIGN')],
                      And([e for (e, stmt) in flatTups]))
        sList = []
        for (e, stmt) in flatTups:
            sList += stmt
        return Name(tmp), sList + [assn]

    def visitOr(self, n, args=None):
        flatTups = []
        for exp in n.nodes:
            flatTups.append(self.visit(exp))
        tmp = self.getNextTemp()
        assn = Assign([AssName(tmp, 'OP_ASSIGN')],
                      Or([e for (e, stmt) in flatTups]))
        sList = []
        for (e, stmt) in flatTups:
            sList += stmt
        return Name(tmp), sList + [assn]

    def visitNot(self, n, args=None):
        (expr, sList) = self.visit(n.expr)
        tmp = self.getNextTemp()
        assn = Assign([AssName(tmp, 'OP_ASSIGN')], Not(expr))
        return Name(tmp), sList + [assn]

    # polymorphic operators~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    def visitGetTag(self, n, args=None):
        (arg, stmt) = self.visit(n.arg)
        tmp = self.getNextTemp()
        assn = Assign([AssName(tmp, 'OP_ASSIGN')], GetTag(arg))
        return Name(arg), stmt + [assn]

    def visitProjectTo(self, n, args=None):
        (typ, stmtL)  = self.dispatch(n.typ)
        (arg, stmtR) = self.dispatch(n.arg)
        tmp = self.getNextTemp()
        assn = Assign([AssName(tmp, 'OP_ASSIGN')], ProjectTo(typ, arg))
        return Name(tmp), stmtL + stmtR + [assn]

    def visitInjectFrom(self, n, args=None):

        (typ, stmtL) = self.dispatch(n.typ)
        (arg, stmtR) = self.dispatch(n.arg)
        tmp = self.getNextTemp()
        assn = Assign([AssName(tmp, 'OP_ASSIGN')], InjectFrom(typ, arg))
        return Name(tmp), stmtL + stmtR + [assn]

    # Lists and Dicts ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    def visitSubscript(self, n, args=None):
        (expr, exprList) = self.dispatch(n.expr)
        (subs, subsList) = self.dispatch(n.subs[0])
        tmp = self.getNextTemp()
        assn = Assign([AssName(tmp, 'OP_ASSIGN')], Subscript(expr, 'OP_APPLY', [subs]))
        return Name(tmp), exprList + subsList + [assn]

    def visitList(self, n, args=None):
        tupList = []
        for e in n.nodes:
            tupList.append(self.visit(e))
        tmp = self.getNextTemp()
        assn = Assign([AssName(tmp, 'OP_ASSIGN')],
                      List([e for (e, stmt) in tupList]))
        sList = []
        for (el, stmt) in tupList:
            for ee in stmt:
                sList.append(ee)
        return Name(tmp), sList + [assn]

    def visitDict(self,node):
        tupList = []
        for e in node.items:
            tupList.append((self.visit(e[0]), self.visit(e[1])))
        tmp = self.getNextTemp()
        assn = Assign([AssName(tmp, 'OP_ASSIGN')],
                Dict([(key[0], value[0]) for (key, value) in tupList]))
        keyValueList = []
        for (key, value) in tupList:
            keyValueList += value[1]
            keyValueList += key[1]
        return Name(tmp), keyValueList + [assn]


if __name__ == '__main__':
    import sys
    import compiler
    from explicate2 import *
    pyfi = 'x = 3 + True'

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
    visitor = FlatVisitor()
    ev = ExplicateVisitor()
    x = ev.preorder(tree, ev, True)
    print visitor.preorder(x, visitor, True)
