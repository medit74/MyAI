'''
Created on 2018. 7. 30.

@author: Byoungho Kang
'''

import numpy as np

class Sigmoid:
    
    def __init__(self):
        self.out = None
        
    def forward(self, x):
        out = 1 / (1 + np.exp(-x))
        self.out = out
        return out
    
    def backward(self, dout):
        dx = dout * self.out * (1.0 - self.out)
        return dx
    
sigmoid = Sigmoid()    
x = np.array([[1.1, -0.3],[-1.4,3.1]])
print("입력값 : \n" , x)
print("순전파 : \n" , sigmoid.forward(x))
dout = np.array([[0.1, 0.2],[0.3, 0.4]])
print("손실값 : \n" , dout)
print("역전파 : \n" , sigmoid.backward(dout))
