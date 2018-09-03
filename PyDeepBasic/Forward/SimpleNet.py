'''
Created on 2018. 7. 24.

@author: Byoungho Kang
'''

import numpy as np

def sigmoid(X):
    return 1/(1+np.exp(-X))

def identity(X):
    return X

#1. 신경망초기화
W1 = np.array([[0.1, 0.3, 0.5],[0.2, 0.4, 0.6]])
W2 = np.array([[0.1, 0.4], [0.2, 0.5], [0.3, 0.6]])
W3 = np.array([[0.1, 0.3], [0.2, 0.4]])
b1 = np.array([0.1, 0.2, 0.3])
b2 = np.array([0.1, 0.2])
b3 = np.array([0.1, 0.2])

#2. 입력값
X = np.array([-2, 4])
print("입력층 : ", X)

#3. 순전파
Z1 = sigmoid(np.dot(X, W1) + b1)
print("1st 은닉층 : ", Z1)
Z2 = sigmoid(np.dot(Z1, W2) + b2)
print("2nd 은닉층 : ", Z2)
Y = identity(np.dot(Z2, W3) + b3)
print("출력층 : ", Y)