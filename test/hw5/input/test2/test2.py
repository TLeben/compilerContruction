#!/usr/bin/env python

superList = []

print True if not superList else  42

l = [0,0,0,0,0,0,1]

print l[0]and l[2] and l[3] and l[4] and l[5] or l[6]

l[0] = input()
print l[0]and l[2] and l[3] and l[4] and l[5] or l[6]
l[6] = 99
print l[0]and l[2] and l[3] and l[4] and l[5] or l[6]
print superList == l
l[0] = 0
l[6] = l[2] + l[2]
print l== superList

