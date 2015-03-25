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

