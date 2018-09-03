'''
Created on 2018. 7. 18.

@author: Byoungho Kang
'''

import numpy as np

'문제1'
a1 = np.arange(5,11).reshape(3,2)
a2 = np.arange(1,7).reshape(2,3)

print(np.dot(a1,a2))

'문제2'
a1 = np.arange(0,24).reshape(2,4,3)
b1 = np.ones((4,3))
print(a1)
print(b1)
print(a1+b1)

'문제3'
def sigmoid(x):
    return 1/(1+np.exp(-x))

print(sigmoid(0))

'문제4'
def layer(X):
    W = np.array([[1,3,5],[2,4,6]])
    return np.dot(X, W)

X = np.array([1,2])
print(layer(X))