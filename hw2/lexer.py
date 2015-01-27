#!/usr/bin/env python

# lexer.py
# tokenizer for p0, processes integers, =, +, - (unary sub)
#

import ply.lex as lex


class Lexer:
    # reserved words go here as key:value pair
    reserved = {
        'print': 'PRINT'
    }
    # List of token names
    # This list is also used by yacc for terminals
    tokens = [
        'ASSIGN',
        'ID',
        'INT',
        'PLUS',
        'UNARY_SUB',
    ] + list(reserved.values())

    # Regex rules for simple tokens
    t_ASSIGN = r'='
    t_PLUS = r'\+'
    # avoid rules for reserved words bc this will pick up 'printed'
    # good test case
    # t_PRINT = r'print'
    t_UNARY_SUB = r'-'

    # Regrex rule with action code
    def t_INT(self, t):
        r'\d'
        try:
            t.value = int(t.value)
        except ValueError:
            print 'integer value too large', t.value
            t.value = 0
        return t

    def t_ID(self, t):
        r'[a-zA-Z_][a-zA-Z_0-9]*'
        # check for reserved words
        t.type = self.reserved.get(t.value, 'ID')
        # @TODO add t.value to symbol table ~ Maybe?
        return t

    # comments are discarded so nothing is returned

    def t_COMMENT(self, t):
        r'\#.*'
        pass

    # String containing ignore characters (spaces adn tabs)
    t_ignore = ' \t'

    # rule to track line numbers
    def t_newline(self, t):
        r'\n+'
        t.lexer.lineno += t.value.count('\n')

    def t_error(self, t):
        print "Illegal character '%s'" % t.value[0]
        t.lexer.skip(1)

    # Build lexer
    def build(self, **kwargs):
        self.lexer = lex.lex(module=self, **kwargs)

    # Tokenize test with output
        # lexer.token() returns next instances of LexToken
        # with the following attributes
        # tok.type, ie INT or PLUS
        # tok.value, ie 3 or +
        # tok.lineno - row of token
        # tok.lexpos - # of token in stream
    def test(self, data):
        self.lexer.input(data)
        for tok in self.lexer:  # Give data to lexer with input()
            print tok
            # print tok.type, tok.value, tok.lineno, tok.lexpos

#------------------------------------------------------------
# testing out the lexer

data = '''
# I am a comment and should not be a token
val = 3 + -8
print val
'''
lx = Lexer()
lx.build()
lx.test(data)
