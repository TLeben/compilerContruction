#!/usr/bin/env python

def main():
    x = input()
    return lambda a: x + a

print main()(main()(4))

