
#@TODO change Node.colors set from numbers to the register names (or colors)
#@TODO change tiebraker to use a heuristic instead of ramdom
#@TODO figure out what to do if a partial answer is returned- maybe add a 'spill' value 
#   to the domain and run again giving the spill val low weight. repeat until we have an optimal answer

import Queue
import random
from utils import *


class Graph(object):

    '''

    Usage: addArc(u,v) 
        u is a string variable name
        v is a string/list/set of variables names
        returns: None
        **if arc x,y is added arc y,x does not need to be added,
             but it wont break anything if it is  
        ***if u has been added the v additions use set union 
             so they are only added if unique 

        colorGraph() 
            returns: a dict of {variable : value} of either 
                    1) complete colored graph 
                       or
                    2) a tuple (False, {partial colored graph})
    '''

    def __init__(self):
        self.values = ['%eax', '%ebx','%ecx']
        self.vars = []     # variables that need registers
        self.neighbors = dict()  # {variable: [neighbors]} *can be empty list
        self.domains = dict()  # {variable: [possible domains]}
        self.final = dict()  # {variable: single domain}
        self.currDomains = None   # {variable: [working list of domains]}
    
    def addNode(self, nodeName):
        '''
        use addArc if possible
        '''
        if nodeName not in self.vars:
            self.neighbors[nodeName] = set([])
            self.domains[nodeName] = self.values
            self.vars.append(nodeName)
            return True
        return False

    def addArc(self, u, v):
        '''
        u is a start node and v a set/list of vertices or a single vertex
        '''

        if u not in self.vars:
            self.addNode(u)
        if isinstance(v, list):  # v is a list []
            v = set(v)
        if isinstance(v, set):  # v is a set([])
            # union the new set with existing vertices
            self.neighbors[u] = self.neighbors[u] | v
            for vert in v:
                self.addArc(vert, u)
        else:  # single vertex, ie 'tmp0'
            self.neighbors[u].add(v)
            if v not in self.vars:
                self.addArc(v, u)

    def assign(self, var, val, assignments):
        '''
        adds {var:val} to assignments
        '''
        assignments[var] = val

    def unassign(self, var, assignments):
        '''
        removes {var:val} from assignments
        '''
        if var in assignments:
            del assignments[var]

    def tieBreaker(self, seq, func):
        '''
        Return an element with lowest func(seq[i]) score; break ties at random.
        '''
        bestScore = func(seq[0])
        n = 0
        for x in seq:
            xScore = func(x)
            if xScore < bestScore:
                best, bestScore = x, xScore
                n = 1
            elif xScore == bestScore:
                n += 1
                if random.randrange(n) == 0:
                    best = x
        return best

    def highBreaker(self, seq, func):
        '''
        Return an element with lowest func(seq[i]) score; break ties at random.
        '''
        hiScore = func(seq[0])
        n = 0
        for x in seq:
            xScore = func(x)
            if xScore > hiScore:
                best, hiScore = x, xScore
                n = 1
            elif xScore == hiScore:
                n += 1
                if random.randrange(n) == 0:
                    best = x
        return best

    def every(self, predicate, seq):
        '''
        helper function 
        '''
        for x in seq:
            if not predicate(x):
                return False
        return True

    def count_if(self, predicate, seq):
        '''
        count elements in seq if they match predicate
        '''
        f = lambda count, x: count + (not not predicate(x))
        return reduce(f, seq, 0)

    def find_if(self, predicate, seq):
        '''
        find element in seq if it satisfies the predicate
        '''
        for x in seq:
            if predicate(x):
                return x
        return None

    def check(self, u, uColor, v, vColor):
        '''Constraint that U and V can have the same assignment
        '''
        return uColor != vColor

    def numConflicts(self, var, color, assignment):
        def conflict(v2):
            return (v2 in assignment
                    and not self.check(var, color, v2, assignment[v2]))
        return self.count_if(conflict, self.neighbors[var])

    

    def search(self, nodeName, lst):
        return next((x for x in lst if nodeName == x.__name__), None)


    def prune(self, var, value, removals):
        "Rule out var=value."
        self.curr_domains[var].remove(value)
        if removals is not None:
            removals.append((var, value))

    def restore(self, removals):
        '''
        reset our domains because we hit a roadblock
        '''
        for vr, d in removals:
            self.curr_domains[vr].append(d)

    def infer(self, var, value):
        if self.currDomains is None:
            self.currDomains = dict((v, list(self.domains[v]))
                                    for v in self.vars)
        removals = [(var, d) for d in self.currDomains[var] if d != value]
        self.currDomains[var] = [value]
        return removals
    # ac3 adapted from Artificial Inteligence- A Modern Approach

    def ac3(self, queue=None, removals=None):

        if queue is None:
            queue = [(u, v) for u in self.vars for v in self.neighbors[u]]

        # used for pruning domains
        self.curr_domains = dict((v, list(self.domains[v]))
                                 for v in self.vars)
        while queue:
            (u, v) = queue.pop()
            if self.revise(u, v, removals):
                if not self.curr_domains[u]:
                    return False
                for vert in self.neighbors[u]:
                    if vert != u:
                        queue.append((vert, u))
            return True

    def revise(self, u, v, removals):
        "Return true if we remove a value."
        revised = False
        for x in self.curr_domains[u][:]:
            # If u=x conflicts with v=y for every possible y, eliminate u=x
            if self.every(lambda y: not self.check(u, x, v, y),
                          self.curr_domains[v]):
                self.prune(u, x, removals)
                revised = True
        return revised

    # inference - use heuristic to remove obvious invalid values
    def maintainArcConsistency(self, var, value, assigment, removals):
        return self.ac3([(u, var) for u in self.neighbors[var]], removals)

    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    # varSelect - this is the way we choose an unassigned variable
    def mostConstrainedVar(self, assignment):
        '''
        Chooses the vertex with highest degree
            Not very good for constraint propagation
        '''
        return self.highBreaker([v for v in self.vars if v not in assignment],
                    lambda var : len(self.neighbors[var]))
    
    def minRemainingValues(self, assignment):
        '''
        Chooses the variable with the smallest domain set 
        '''
        return self.tieBreaker(
            [v for v in self.vars if v not in assignment],
            lambda var: self.validValues(var, assignment))
    
    def validValues(self, var, assignment):
        if self.currDomains:
            return len(self.currDomains[var])
        else:
            return self.count_if(lambda val: self.numConflicts(var, val, assignment) == 0,
                                 self.domains[var])

    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    # domainSort - this is the way we order the valid domain values
    def leastConstrainingValue(self, var, assignment):
        options = (self.currDomains or self.domains)[var]
        return sorted(options, key=lambda val: self.numConflicts(var, val, assignment))

    # ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

    def colorGraph(self,
                   varSelect=minRemainingValues,
                   domainSort=leastConstrainingValue,
                   inference=maintainArcConsistency):

        def backtrack(assignment):
            if len(assignment) == len(self.vars):
                return assignment
            var = varSelect(self, assignment)
            for value in domainSort(self, var, assignment):
                if 0 == self.numConflicts(var, value, assignment):
                    self.assign(var, value, assignment)
                    removals = self.infer(var, value)
                    if inference(self, var, value, assignment, removals):
                        result = backtrack(assignment)
                        if result is not None:
                            return result
                    self.restore(removals)
                self.unassign(var, assignment)
            # No solution was found
            return (False, assignment)

            # self.unassign(var, assignment)
            # return None
                

        result = backtrack({})
        # assert result is None or self.goal_test(result)
        return result


if __name__ == '__main__':
    '''
    Use your imagination
         b--c
        /\ /|
       a--d-e
           \|
            f
 >>>3 colors:{'a': 'blue', 'c': 'blue', 'b': 'red', 'e': 'red', 'd': 'green', 'f': 'blue'}
 
 >>>2 colors:{'a': 'green', 'c': 'green', 'b': 'red', 'e': 'red', 'f': 'green'}
  *** d is missing
    '''
    g = Graph()
    g.addNode('a')
    g.addArc('a', 'b')
    g.addArc('d', set(['a', 'b', 'c']))
    g.addArc('d', set(['b', 'c', 'e', 'f']))
    # g.addArc('b',set(['d','c']))
    g.addArc('c', set(['e', 'd', 'b']))
    g.addArc('e', set(['d', 'f']))
    g.addArc('f', set(['d', 'e']))
    g.colorGraph()



    # print g.neighbors
    # print g.domains
    print g.colorGraph()

    # make a graph
