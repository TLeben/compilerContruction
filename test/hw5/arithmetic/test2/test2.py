#!/usr/bin/env python

def recurse(x):
    return 1 if x == 0 else x + recurse(x - 1)

print recurse(10)