#!/usr/bin/env python

# parse.py

import ply.yacc as yacc
from compiler.ast import Printnl, Add, Const, Assign, AssName, Stmt, Name
from lexer import Lexer

class Parser:
    precedence = ( 
        ('nonassoc','PRINT'),
        ('left','PLUS')
        )   

    def p_print_statement(self, t):
        'statement : PRINT expression'
        t[0] = Printnl([t[2]], None)

    def p_plus_expression(self, t):
        'expression : expression PLUS expression'
        t[0] = Add((t[1], t[3]))

    def p_int_expression(self, t):
        'expression : INT'
        t[0] = Const(t[1])

    def p_assign_statement(self, t):
        'statement : ID ASSIGN expression'
        self.ids[t[1]] = t[3]
        t[0] = Assign(AssName(t[1], 'OP_ASSIGN'), t[3])

    def p_statement_expr(self, t):
        'statement : expression'
        t[0] = Stmt(t[1])

    def p_expression_name(self, t):
        'expression : ID'
        try:
            t[0] = Name(self.ids[t[1]])
        except LookupError:
            print "Undefined name '%s'" % t[1]
            t[0] = 0

    def p_error(self, t):
        print "Syntax error at '%s'" % t.value

    def __init__(self, **kwargs):
        self.ids = { }
        self.lexer = Lexer()
        self.tokens = self.lexer.tokens
        self.parser = yacc.yacc(module=self, **kwargs)

    def parse(self, inFile, *args, **kwargs):
        f = open(inFile)
        return self.parser.parse(f.read(), lexer=self.lexer, debug=False, *args, **kwargs)

