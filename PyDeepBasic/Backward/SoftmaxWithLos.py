'''
Created on 2018. 7. 30.

@author: Byoungho Kang
'''

import numpy as np
from MyLib.functions import softmax, cross_entropy_error

class SoftmaxWithLoss:
    
    def __init__(self):
        self.loss = None
        self.y = None       # Softmax 출력
        self.t = None       # 정답레이블 (One-Hot 인코딩)
        
    def forward(self, x, t):
        self.t = t 
        self.y = softmax(x)
        self.loss = cross_entropy_error(self.y, self.t)
        return self.loss
    
    def backward(self, dout=1):
        batchSize = self.t.shape[0]
        dx = (self.y - self.t) / batchSize
        return dx

softmaxloss = SoftmaxWithLoss()
x = np.array([0.3, 0.2, 0.5])
t = np.array([0.0, 1.0, 0.0])
print(softmaxloss.forward(x, t))
print(softmaxloss.backward())

x = np.array([0.1, 0.9, 0.0])
t = np.array([0.0, 1.0, 0.0])
print(softmaxloss.forward(x, t))
print(softmaxloss.backward())
