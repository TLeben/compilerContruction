#!/usr/bin/env python

# parse.py

import ply.yacc as yacc
from compiler.ast import *
from lexer import Lexer

# @TODO: failing test cases
#           a = -1 + 1  UnarySub is in the wrong order in Add (although a = 1 + -1 works)

#           a = 1
#           b = 2       The second assignment throws an error

class Parser:
    precedence = ( 
        ('nonassoc','PRINT'),
        ('left','PLUS')
        )   

    ids = { }

    #
    # grammar rule
    #   simple_statement ::= "print" expression
    #
    def p_print_statement(self, t):
        'statement : PRINT expression'
        if self.debug >= 1: print "got print"
        t[0] = Stmt([Printnl([t[2]], None)])


    #
    # grammar rule
    #   simple_statement ::= name "=" expression
    #
    def p_assign_statement(self, t):
        'statement : ID ASSIGN expression'
        if self.debug >= 1: print "got assign"
        ids[t[1]] = t[3]
        t[0] = Stmt([Assign([AssName(t[1], 'OP_ASSIGN')], t[3])])


    #
    # grammar rule
    #   simple_statement ::= expression
    #
    def p_statement_expr(self, t):
        'statement : expression'
        if self.debug >= 1: print "got statement"
        t[0] = Stmt(t[1])


    #
    # grammar rule
    #   expression ::= name
    #
    def p_expression_name(self, t):
        'expression : ID'
        if self.debug >= 1: print "got name"
        if self.debug >= 1: print "t[0] = {}, t[1] = {}".format(t[0], t[1])
        try:
            t[0] = Name(ids[t[1]])
        except LookupError:
            print "Undefined name '%s'" % t[1]
            t[0] = 0


    #
    # grammar rule
    #   expression ::= decimalinteger
    #
    def p_int_expression(self, t):
        'expression : INT'
        if self.debug >= 1: print "got int"
        t[0] = Const(t[1])


    #
    # grammar rule
    #   expression ::= "-" expression
    #
    def p_expression_unary_sub(self, t):
        'expression : UNARY_SUB expression'
        if self.debug >= 1: print "got unary sub"
        t[0] = UnarySub(t[2])


    #
    # grammar rule
    #   expression ::= expression "+" expression
    #
    def p_plus_expression(self, t):
        'expression : expression PLUS expression'
        if self.debug >= 1: print "got n + n"
        t[0] = Add((t[1], t[3]))


    #
    # grammar rule
    #   expression ::= "(" expression ")"
    #
    def p_expression_group(self, t):
        'expression : LPAREN expression RPAREN'
        if self.debug >= 1: print "got parens"
        t[0] = t[2]


    #
    # grammar rule
    #   expression ::= "input" "(" ")"
    #
    def p_expression_input(self, t):
        'expression : INPUT'
        if self.debug >= 1: print "got input()"
        t[0] = CallFunc(Name(t[1]), [], None, None)


    def p_error(self, t):
        print "Syntax error at '%s'" % t.value

    def __init__(self, **kwargs):
        self.debug = 1
        self.ids = { }
        self.lexer = Lexer()
        self.tokens = self.lexer.tokens
        self.parser = yacc.yacc(module=self, **kwargs)

    def parse(self, inFile, *args, **kwargs):
        f = open(inFile)
        print "======================================================="
        self.lexer.test(f.read())
        f.seek(0, 0)
        print "======================================================="
        return self.parser.parse(f.read(), lexer=self.lexer, debug=False, *args, **kwargs)

