#!/usr/bin/env python

# parse.py

import ply.yacc as yacc
from compiler.ast import *
from lexer import Lexer

# @TODO: failing test cases
# a = -1 + 1  UnarySub is in the wrong order in Add (although a = 1 + -1
# works)

#           a = 1
# b = 2       The second assignment throws an error.  going from INT -> ID
# throws an error

# @TODO: I feel like p_statement_expr should be called.  I shouldn't have to add a Stmt outside of that function.
# @TODO: p_expression_name also doesn't seem to be getting called enough / at all


class Parser:
    DOCSTRING = 'Compiled by TangoMikes'
    precedence = (
        ('nonassoc', 'PRINT'),
        ('nonassoc', 'ASSIGN'),
        ('left', 'PLUS'),
        ('right', 'UNARY_SUB')
        # ('left', 'LPAREN', 'RPAREN')
    )

    ids = {}

    def p_module(self, t):
        '''module : statement-list'''
        t[0] = Module(None, t[1])

    #
    # grammar rule
    #   <statement-list> ::= statement "\n" statement-list
    #                      | statement    **provides closure for <statement-list>
    #
    def p_statement_list(self, t):
        '''statement-list : statement NEWLINE statement-list
                          | statement statement-list
                          | statement'''

        if len(t) == 4:
            if isinstance(t[3], Stmt):
                print 'len is 4 '
                print 't[3]', t[3].nodes
                print 't[1]', t[1]
                t[0] = Stmt([t[1]] + t[3].nodes)
                print t[0]
        elif len(t) == 3:
            if isinstance(t[2], Stmt):
                print 'len is 3 ', t[1], t[2]
                t[0] = Stmt([t[1]] + t[2].nodes)
            # t[0] = t[1],t[3]
        else:
            if self.debug >= 1:
                print 'got st', t[1]
            t[0] = Stmt([t[1]])
            # t[0] = t[0], t[1]

    #
    # grammar rule
    #   <statement> ::= "print" <expression>
    #
    def p_print_statement(self, t):
        'statement : PRINT expression'
        if self.debug >= 1:
            print "got print "
        t[0] = Printnl([t[2]], None)
        # t[0] = t[1], t[2]

    #
    # grammar rule
    #   statement ::= name "=" expression
    #
    def p_assign_statement(self, t):
        'statement : assName expression'
        if self.debug >= 1:
            print "got assign "
        # ids[t[1]] = t[3]
        t[0] = Assign([t[1]], t[2])
        # t[0] = t[1], t[2], t[3]

    #
    # grammar rule
    #   statement ::= "discard" <expression>
    #
    def p_statement_expr(self, t):
        'statement : expression'
        if self.debug >= 1:
            print "got statement "
        t[0] = Discard(t[1])
        # t[0] = t[1]

    #
    # grammar rule
    #   <expression> ::= name
    #
    def p_expression_name(self, t):
        'expression : ID'
        if self.debug >= 1:
            print "got name "
        if self.debug >= 1:
            print "t[0] = {}, t[1] = {}".format(t[0], t[1])
        try:
            t[0] = Name(t[1])
            # t[0] = t[1]
        except LookupError:
            print "Undefined name '%s'" % t[1]
            # t[0] = 0

    #
    # grammar rule
    #   <expression> ::= decimalinteger
    #
    def p_int_expression(self, t):
        'expression : INT'
        if self.debug >= 1:
            print "got int "
        t[0] = Const(t[1])
    #
    # grammar rule
    #   <expression> ::= "-" <expression>
    #

    def p_expression_unary_sub(self, t):
        'expression : UNARY_SUB expression'
        if self.debug >= 1:
            print "got unary sub "
        t[0] = UnarySub(t[2])

    #
    # grammar rule
    #   expression ::= <expression> "+" <expression>
    #
    def p_plus_expression(self, t):
        'expression : expression PLUS expression'
        if self.debug >= 1:
            print "got n + n "
        t[0] = Add([t[1], t[3]])
        # t[0] = t[1], t[2], t[3]

    #
    # grammar rule
    #   expression ::= "(" <expression> ")"
    #
    def p_expression_group(self, t):
        'expression : LPAREN expression RPAREN'
        if self.debug >= 1:
            print "got parens "
        t[0] = t[2]

    #
    # grammar rule
    #   expression ::= "input" "(" ")"
    #
    def p_expression_input(self, t):
        'expression : INPUT'
        if self.debug >= 1:
            print "got input() "
        t[0] = CallFunc(Name(t[1]), [], None, None)

    #
    # grammar rule
    #   assName ::= ID "="
    #
    def p_assName(self, t):
        'assName : ID ASSIGN'
        t[0] = AssName(t[1], 'OP_ASSIGN')

    def p_error(self, t):
        print "Syntax error at '%s'" % t.value
        print self.parser.token()

    def __init__(self, **kwargs):
        self.debug = 1
        self.ids = {}
        self.lexer = Lexer()
        self.tokens = self.lexer.tokens
        self.parser = yacc.yacc(module=self, **kwargs)
        self.aTree = Stmt(None)
        # print self.aTree.nodes

    def parse(self, inFile, *args, **kwargs):
        f = open(inFile)
        print "======================================================="
        self.lexer.test(f.read())
        f.seek(0, 0)
        print "======================================================="
        return self.parser.parse(f.read(), lexer=self.lexer, debug=False, *args, **kwargs)
