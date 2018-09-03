'''
Created on 2018. 7. 27.

@author: Byoungho Kang
'''

import numpy as np
from MyLib.functions import softmax, cross_entropy_error
from MyLib.gradient import numerical_gradient

class SimpleNet:
    
    def __init__(self):
        self.W = np.random.randn(2,3)
        
    def predict(self, x):
        z = np.dot(x, self.W)
        y = softmax(z)
        return y
    
    def loss(self, x, t):
        y = self.predict(x)
        loss = cross_entropy_error(y, t)
        print("가중치 \n", self.W, "\n - 손실 값 : ", loss)
        return loss
    
net = SimpleNet()
x = np.array([0.6, 0.9])
t = np.array([0, 0, 1])

print("입력값: ", x)
print("가중치 초기값: \n", net.W)
print("=================================================")

f = lambda w: net.loss(x,t)

grad = numerical_gradient(f, net.W)
print("=================================================")
print("신경망 기울기: \n", grad)