'''
Created on 2018. 7. 30.

@author: Byoungho Kang
'''

import numpy as np

class Affine:
    
    def __init__(self, W, b):
        self.W = W
        self.b = b 
        self.x = None
        self.dW = None
        self.db = None 
        
    def forward(self, x):
        self.x = x 
        out = np.dot(x, self.W) + self.b
        return out
    
    def backward(self, dout):
        dx = np.dot(dout, self.W.T) 
        self.dW = np.dot(self.x.T, dout)
        self.db = np.sum(dout, axis=0)
        return dx
    
W = np.arange(1,7).reshape(2,3)
b = np.zeros(3)
affine = Affine(W,b)
X = np.arange(1,5).reshape(2,2)
print("--- 순전파 ---")
print(X)
print(W)
print(b)
print(affine.forward(X))
print("--- 역전파 ---")
dout = np.arange(1,7).reshape(2,3)
print(dout)
print(affine.backward(dout))
print(affine.dW)
print(affine.db)