'''
Created on 2018. 7. 30.

@author: Byoungho Kang
'''

import numpy as np

class Relu:
    
    def __init__(self):
        self.mask = None
        
    def forward(self, x):
        self.mask = (x <= 0)
        out = x.copy()
        out[self.mask] = 0
        return out
    
    def backward(self, dout):
        dout[self.mask] = 0
        dx = dout
        return dx
    
relu = Relu()    
x = np.array([[1.1, -0.3],[-1.4,3.1]])
print("입력값 : \n" , x)
print("순전파 : \n" , relu.forward(x))
print("마스크 : \n" , relu.mask)
dout = np.array([[0.1, 0.2],[0.3, 0.4]])
print("손실값 : \n" , dout)
print("역전파 : \n" , relu.backward(dout))
