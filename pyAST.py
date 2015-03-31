from compiler.ast import *
from x86AST import *
# Types
INT_t = 'INT'
BOOL_t = 'BOOL'
FUN_t = 'FUN'
BIG_t = 'BIGPYOBJ'
tagof = {'INT': Const(0),
         'BOOL': Const(1),
         'FUN': Const(3),
         'BIGPYOBJ': Const(3)}
TRUE = 'True'
TRUEVAL = 1
FALSE = 'False'
FALSEVAL = 0

# reserved functions
reservedFuncs = ['input', 'type_error', 'create_class', 'create_object',
                 'is_class', 'get_function', 'get_receiver', 'is_bound_method',
                 'is_unbound_method']

#registers

registers = ['eax', 'ebx', 'ecx', 'edx', 'esi', 'ebi', 'esp', 'ebp']
gpRegs = []
calleeSaveRegs = ['ebx', 'esi', 'edi']

#symtable for var allocation
symTable = {}

class ProjectTo(Node):
    '''convert polymorphic arg to typ'''
    def __init__(self, typ, arg, lineno=None):
        self.typ = typ
        self.arg = arg

    def __repr__(self):
        return 'ProjectTo({}, {})'.format(str(self.typ), str(self.arg))


class InjectFrom(Node):
    '''convert monomorphic arg to pyobj of type typ'''

    def __init__(self, typ, arg):
        self.typ = typ
        self.arg = arg

    def __repr__(self):
        return 'InjectFrom({}, {})'.format(str(self.typ), str(self.arg))


class GetTag(Node):
    '''returns tag from pyObj'''
    def __init__(self, arg):
        self.arg = arg

    def __repr__(self):
        return 'GetTag({})'.format(str(self.arg))


class IntAdd(Add):

    def __repr__(self):
        return 'IntAdd(({}, {}))'.format(str(self.left),  str(self.right) )


class BigAdd(Add):

    def __repr__(self):
        return 'BigAdd(({}, {}))'.format(str(self.left),  str(self.right) )


class IntCompare(Compare):

    def __repr__(self):
        return 'IntCompare({}, {})'.format(str(self.expr), str(self.ops))


class BigCompare(Compare):

    def __repr__(self):
        return 'BigCompare({}, {})'.format(str(self.expr), str(self.ops))


class IsCompare(Compare):

    def __repr__(self):
        return 'IsCompare({}, {})'.format(str(self.expr), str(self.ops))


class Let(Node):
    def __init__(self, var, rhs, body, lineno=None):
        self.var = var
        self.rhs = rhs
        self.body = body

    def __repr__(self):
        return 'Let(%s, %s, %s)' % (repr(self.var), repr(self.rhs),
                                    repr(self.body))

# p2 ---------------------------------------------------------------------------


class Closure(Node):
    name = None
    symTable = None

    def __init__(self, name, symTable):
        self.name = name
        self.symTable = symTable

    def __repr__(self):
        return 'Closure({}, {})'.format(self.name, self.symTable)


class IndirectCall(CallFunc):

    def __repr__(self):
        return 'IndirectCall({}, {})'.format(self.node, self.args)


class GetFunPtr(Node):
    name = None

    def __init__(self, name):
        self.name = name

    def __repr__(self):
        return 'GetFunPtr({})'.format(self.name)


class GetFreeVars(Node):
    name = None

    def __init__(self, name):
        self.name = name

    def __repr__(self):
        return 'GetFreeVars({})'.format(self.name)



