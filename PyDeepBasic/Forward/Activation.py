'''
Created on 2018. 7. 23.

@author: Byoungho Kang
'''

import numpy as np
import matplotlib.pyplot as plt

def step(X):
    Y = X > 0
    return Y.astype(np.int)

def sigmoid(X):
    return 1/(1+np.exp(-X))

def relu(X):
    return np.maximum(0,X)

def softmax(X):
    expX = np.exp(X - np.max(X))
    sumExpX = np.sum(expX)
    return expX / sumExpX

X = np.arange(-5, 5, 0.1)
Y1 = step(X)
plt.plot(X, Y1)
plt.show()

X = np.arange(-5, 5, 0.1)
Y2 = sigmoid(X)
plt.plot(X, Y2)
plt.show()

X = np.arange(-5, 5, 0.1)
Y3 = relu(X)
plt.plot(X, Y3)
plt.show()

X = np.array([2.3, -0.9, 3.6])
Y = softmax(X)
print(Y, np.sum(Y))

X = np.array([990, 1000, 1010])
Y = softmax(X)
print(Y, np.sum(Y))
