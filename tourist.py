from pyAST import *

class NotImplementedException(Exception):
    '''
    NotImplementedException is raised to handle AST nodes
    not yet implemented in the language.
    '''
    pass


class Visitor(object):
    """Performs a depth-first walk of the AST

    The Visitor will walk the AST, performing either a preorder.

    methods:
    preorder(tree, visitor)
        tree: an instance of ast.Node
        visitor: an instance with visitXXX methods

    The Visitor is responsible for walking over the tree in the
    correct order.  For each node, it checks the visitor argument for
    a method named 'visitNodeType' where NodeType is the name of the
    node's class, e.g. Class.  If the method exists, it is called
    with the node as its sole argument.

    The visitor method for a particular node type can control how
    child nodes are visited during a preorder walk.The Visitor modifies the visitor
    argument by adding a visit method to the visitor; this method can
    be used to visit a child node of arbitrary type.
    """

    debug = 0

    def __init__(self):
        self.node = None
        self._cache = {}

    def default(self, n, *args):
        print n, '``````````````````````````````````````````'
        raise NotImplementedException(n.__class__.__name__)

    def dispatch(self, node, *args):
        self.node = node
        klass = node.__class__
        meth = self._cache.get(klass, None)
        if meth is None:
            className = klass.__name__
            meth = getattr(self, 'visit' + className, self.default)
            self._cache[klass] = meth
        if self.debug > 0:
            className = klass.__name__
        if self.debug > 1:
            if meth == 0:
                print "dispatch", className
            else:
                print "dispatch", className, (meth and meth.__name__ or '')
        return meth(node, *args)

    def preorder(self, tree, visitor, *args):
        """Do preorder walk of tree using visitor
        """
        self.visitor = visitor
        visitor.visit = self.dispatch
        return self.dispatch(tree, *args)

    def doPass(self, ast,  debug=0):
        if debug:
            print '-'*20 + self.__class__.__name__ + '-'*20
        passed = self.dispatch(ast)
        if debug:
            self.toString(passed)
        return passed

    def toString(self, stmts, tab=0):
        if stmts.nodes:
            sList = stmts.nodes
        else:
            sList = stmts.node.nodes
        for n in sList:
            if isinstance(n, If):
                print '\t' * tab + 'If: ' + str(n.tests[0][0]) + ' then:'
                self.toString(n.tests[0][1], tab+1)
                print '\t' * (tab) + 'Else: '
                self.toString(n.else_, tab+1)
                print '\t' * (tab) + 'End If'
            elif isinstance(n, While):
                print '\t' * tab + 'While: ' + str(n.test) + ' then:'
                self.toString(n.body, tab+1)
                print '\t' * (tab) + 'End While'
            elif isinstance(n, Lambda):
                print '\t' * tab + 'Lambda (' + str(n.argnames) + '):'
                self.toString(Stmt([n.code]), tab+1)
                print '\t' * tab + 'EndLambda'
            elif isinstance(n, Function):
                print '\t' * tab + 'def ' + str(n.name) + '(' + str(n.argnames) + '):'
                self.toString(n.code, tab+1)
                print '\t' * tab + 'EndFunc'
            else:
                print '\t' * (tab) + str(n)

