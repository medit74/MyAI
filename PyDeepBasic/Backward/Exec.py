'''
Created on 2018. 7. 30.

@author: Byoungho Kang
'''

class AddLayer:
    
    def __init__(self):
        pass        # 아무것도 하지말 것.
    
    def forward(self, x, y):
        return x+y
    
    def backward(self, dout):
        dx = dout * 1
        dy = dout * 1
        return dx, dy
    
class MulLayer:
    
    def __init__(self):
        self.x = None   # 순전파의 입력값을 유지
        self.y = None
        
    def forward(self, x, y):
        self.x = x 
        self.y = y 
        return x*y 

    def backward(self, dout):
        dx = dout*self.y 
        dy = dout*self.x 
        return dx, dy

# 입력값    
inputA = 5
inputB = 3 

# 계산그래프 설계
layer11 = MulLayer()
layer12 = AddLayer()
layer2  = AddLayer()

# 순전파
c = layer11.forward(inputA, inputB)
d = layer12.forward(inputA, inputB)
e = layer2.forward(c, d)
print(c, d, e)

# 역전파
dout = 1
dc, dd = layer2.backward(dout)
dac, dbc = layer11.backward(dc)
dad, dbd = layer12.backward(dd)
print(dc, dd)
print(dac, dbc, dad, dbd)