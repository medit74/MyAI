'''
Created on 2018. 7. 24.

@author: Byoungho Kang
'''

import numpy as np

def relu(X):
    return np.maximum(0,X)

def identity(X):
    return X

#1. 신경망초기화
W1 = np.random.randn(10,5)
W2 = np.random.randn(5,8)
W3 = np.random.randn(8,4)
b1 = np.zeros(5)
b2 = np.zeros(8)
b3 = np.zeros(4)
print(W1.shape)
print(W2.shape)
print(W3.shape)
print(b1.shape)
print(b2.shape)
print(b3.shape)

#2. 입력값
X = np.arange(0,10)
print("입력층 : ", X)

#3. 순전파
Z1 = relu(np.dot(X, W1) + b1)
print("1st 은닉층 : ", Z1)
Z2 = relu(np.dot(Z1, W2) + b2)
print("2nd 은닉층 : ", Z2)
Y = identity(np.dot(Z2, W3) + b3)
print("출력층 : ", Y)