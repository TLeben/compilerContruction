#!/usr/bin/env python

# parse.py

import sys
sys.path.append('ply-3.4')
import yacc
from compiler.ast import *
from lexer import Lexer


class Parser:
    precedence = (
        ('nonassoc', 'PRINT'),
        ('nonassoc', 'ASSIGN'),
        ('left', 'PLUS'),
        ('right', 'UNARY_SUB')
    )

    def p_module(self, t):
        '''module : statement-list'''
        if self.debug >= 1:
            print "got module"
        if self.debug >= 2:
            self.print_debug(t)

        t[0] = Module(None, t[1])

    #
    # grammar rule
    #   <statement-list> ::= statement "\n" statement-list
    #                      | statement    **provides closure for <statement-list>
    #
    def p_statement_list(self, t):
        '''statement-list : statement statement-list
                          | statement'''

        if self.debug >= 1:
            print "got statement list"
        if self.debug >= 2:
            self.print_debug(t)

        if len(t) == 3:
            if isinstance(t[2], Stmt):
                if self.debug >= 1:
                    print 'len is 3 ', t[1], t[2]

                t[0] = Stmt([t[1]] + t[2].nodes)
        else:
            if self.debug >= 1:
                print 'got st', t[1]
            t[0] = Stmt([t[1]])

    #
    # grammar rule
    #   simple_statement ::= expression
    #
    def p_statement_discard(self, t):
        'statement : expression'
        if self.debug >= 1:
            print "got discard statement"
        if self.debug >= 2:
            self.print_debug(t)

        t[0] = Discard(t[1])

    #
    # grammar rule
    #   <statement> ::= "print" <expression>
    #
    def p_print_statement(self, t):
        'statement : PRINT expression'
        if self.debug >= 1:
            print "got print statement"
        if self.debug >= 2:
            self.print_debug(t)

        t[0] = Printnl([t[2]], None)

    #
    # grammar rule
    #   statement ::= name "=" expression
    #
    def p_assign_statement(self, t):
        'statement : assName expression'
        if self.debug >= 1:
            print "got assName assign"
        if self.debug >= 2:
            self.print_debug(t)

        t[0] = Assign([t[1]], t[2])

    #
    # grammar rule
    #   statement ::= "discard" <expression>
    #
    # def p_statement_expr(self, t):
    #     'statement : expression'
    #     if self.debug >= 1:
    #         print "got assign expr"
    #     if self.debug >= 2:
    #         self.print_debug(t)

    #     t[0] = Discard(t[1])

    #
    # grammar rule
    #   <expression> ::= name
    #
    def p_expression_name(self, t):
        'expression : ID'
        if self.debug >= 1:
            print "got name"
        if self.debug >= 2:
            self.print_debug(t)
        if t[1] in self.ids:
            t[0] = Name(t[1])
        else:
            print 'Undefined variable: ', t[1]
            t[0] = Name(t[1])

    #
    # grammar rule
    #   <expression> ::= decimalinteger
    #
    def p_int_expression(self, t):
        'expression : INT'
        if self.debug >= 1:
            print "got int"
        if self.debug >= 2:
            self.print_debug(t)

        t[0] = Const(t[1])

    #
    # grammar rule
    #   <expression> ::= "-" <expression>
    #
    def p_expression_unary_sub(self, t):
        'expression : UNARY_SUB expression'
        if self.debug >= 1:
            print "got unary sub"
        if self.debug >= 2:
            self.print_debug(t)

        t[0] = UnarySub(t[2])

    #
    # grammar rule
    #   expression ::= <expression> "+" <expression>
    #
    def p_plus_expression(self, t):
        'expression : expression PLUS expression'
        if self.debug >= 1:
            print "got n + n"
        if self.debug >= 2:
            self.print_debug(t)

        t[0] = Add([t[1], t[3]])

    #
    # grammar rule
    #   expression ::= "(" <expression> ")"
    #
    def p_expression_group(self, t):
        'expression : LPAREN expression RPAREN'
        if self.debug >= 1:
            print "got parens"
        if self.debug >= 2:
            self.print_debug(t)

        t[0] = t[2]

    #
    # grammar rule
    #   expression ::= "input" "(" ")"
    #
    def p_expression_input(self, t):
        'expression : INPUT'
        if self.debug >= 1:
            print "got input()"
        if self.debug >= 2:
            self.print_debug(t)

        t[0] = CallFunc(Name(t[1]), [], None, None)

    #
    # grammar rule
    #   assName ::= ID "="
    #
    def p_assName(self, t):
        'assName : ID ASSIGN'
        if self.debug >= 1:
            print "got id assign"
        if self.debug >= 2:
            self.print_debug(t)

        self.ids.append(t[1])
        t[0] = AssName(t[1], 'OP_ASSIGN')

    def p_error(self, t):
        print "Syntax error at '%s'" % t.value
        print self.parser.token()

    def print_debug(self, t):
        try:
            print "+++++++++++++++++++++++"
            print "t[0] = |{}|".format(t[0])
            print "t[1] = |{}|".format(t[1])
            print "t[2] = |{}|".format(t[2])
            print "t[3] = |{}|".format(t[3])
            print "t[4] = |{}|".format(t[4])
            print "t[5] = |{}|".format(t[5])
            print "t[6] = |{}|".format(t[6])
            print "t[7] = |{}|".format(t[7])
            print "t[8] = |{}|".format(t[8])
            print "t[9] = |{}|".format(t[9])
            print "+++++++++++++++++++++++"
        except IndexError:
            print "+++++++++++++++++++++++"

    def __init__(self, **kwargs):
        self.debug = 0
        self.ids = []
        self.lexer = Lexer()
        self.tokens = self.lexer.tokens
        self.parser = yacc.yacc(module=self, **kwargs)
        self.aTree = Stmt(None)
        # print self.aTree.nodes

    def parse(self, inFile, *args, **kwargs):
        f = open(inFile)
        if self.debug >= 1:
            print "======================================================="
            self.lexer.test(f.read())
            f.seek(0, 0)
            print "======================================================="

        return self.parser.parse(f.read(), lexer=self.lexer, debug=False, *args, **kwargs)
