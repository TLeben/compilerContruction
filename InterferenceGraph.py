###@TODO this is incomplete

#@TODO change Node.colors set from numbers to the register names (or colors)
import Queue

class Graph(object):

    '''
    Graph Structure is dict(), with key = variable and values = set of arcs
    ie tmp0: [x, y], tmp0 has 2 edges 
    '''
    def __init__(self):
        self.g = dict()

    def addNode(self, nodeName):
        if nodeName not in self.g:
            self.g[nodeName] = set ([])
            return True
        return False

    def addArc(self, u, v):
        '''
        u is a start node and v either an end vertex or a set of vertices
        '''

        if u not in self.g:
            self.addNode(u)
        if isinstance(v, set):
            # union the new set with existing vertices
            self.g[u] = self.g[u] | v
            for vert in v:
                #if vert not in self.g:
                
                self.addArc(vert, u)
        else:
            self.g[u] = self.g[u] | set([v])

    def toString(self):
        for n in self.g:
            print str(n)


class Node(object):

    '''
    Node contains a name, list of arcs & color (None is not set)
    max colors I believe is 5
    '''

    def __init__(self, name, arcSet=set([]), color=None):
        self.name = name
        # arc contains nodes, these are the edges, ie self -- tmp1,....
        self.arcs = arcSet
        self.constraints = len(self.arcs)  # maybe fix this
        # @TODO change to names of registers
        self.colors = set([0, 1, 2, 3, 4, 5])

    def __addArc__(self, vertex):
        if vertex not in self.arc:
            self.arc.append(vertex)
            self.constraints = self.constraints + 1

    def __str__(self):
        return self.name, self.arc

    def __cmp__(self, other):
        return cmp(self.constraints, other.constraints)


if __name__ == '__main__':
    g = Graph()
    g.addNode('a')
    g.addArc('a', 'b')
    g.addArc('d', set(['a','b','c']))
    g.addArc('d', set(['b','c','e','f']))
    g.addArc('b',set(['d','c']))
    g.addArc('c',set(['e','d','b']))
    g.addArc('e',set(['d','f']))
    g.addArc('f',set(['d','e']))
    print g.g
    # make a graph
