###@TODO this is incomplete

#@TODO change Node.colors set from numbers to the register names (or colors)


class InterferenceGraph(object):

    '''
    Graph Structure is dict(), with key = variable and values = list of arcs
    ie tmp0: [x, y], tmp0 has 2 edges 
    '''

    def __init__(self):
        self.graph = deque()

    def addNode(self, nodeName):
        if nodeName not in self.graph:
            self.graph.add(nodeName) = set([])
            return True
        return False

    def addArc(self, u, v):
        '''
        u is a start node and v either an end vertex or a set of vertices
        '''
        if u not in self.graph:
            self.addNode(u)
        u.arcs | v

        if isinstance(v, set):
            u.arcs | v
        else:
            u.__addArc__(v)


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
        if vertex in self.arc:
            pass
        else:
            self.arc.append(vertex)

    def __str__(self):
        return self.name, self.arc


if __name__ == '__main__':

    # make a graph
