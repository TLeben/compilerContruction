from selector3 import *
from x86AST import *
import string
import random


class FlowStripper:
    _labelCount = 0

    def getLabel(self, lbl):
        return '{}{}'.format(lbl, self._labelCount)

    def getRandLabel(self, length=6):
        return ''.join(random.choice(
            string.ascii_lowercase +
            string.digits)
                       for _ in range(length))

    def removeIf(self, ifx86):
        inst = []
        labelElse = self.getLabel('else')
        labelEnd = self.getLabel('endif')
        self._labelCount += 1
        for xx in ifx86.lhs:
            inst += self.doPass([xx])
        inst.append(x86Jne(labelElse))
        for xx in ifx86.mhs:
            inst += self.doPass([xx])
        inst.append(x86Jmp(labelEnd))
        inst.append(x86Label(labelElse))
        for xx in ifx86.rhs:
            inst += self.doPass([xx])
        inst.append(x86Label(labelEnd))
        return inst

    def removeWhile(self, whilex86):
        inst = []
        labelLoop = self.getLabel('begLoop')
        labelEnd = self.getLabel('endLoop')
        self._labelCount += 1
        inst.append(x86Label(labelLoop))
        for xx in whilex86.lhs:
            inst += self.doPass(xx)
        inst.append(x86Jne(labelEnd))
        for xx in whilex86.rhs:
            inst += self.doPass(xx)
        inst.append(x86Jmp(labelLoop))
        inst.append(x86Label(labelEnd))
        return inst

    def doPass(self, iList, debug=0):
        inst = []
        if debug:
            print '-'*20 + self.__class__.__name__ + '-'*20
        for i in iList:
            if isinstance(i, x86If):
                inst += self.removeIf(i)
            elif isinstance(i, x86While):
                inst += self.removeWhile(i)
            else:
                inst.append(i)
        if debug:
            x86Selector().prettyPrint(inst, 0)
        return inst


if __name__ == '__main__':
    z = 'x=2'
    x = [x86If(Name('True'), 'print foo', 'print bar')]
    x = FlowStripper().doPass(x)

    for inst in x:
        print inst
