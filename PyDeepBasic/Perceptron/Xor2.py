'''
Created on 2018. 7. 23.

@author: Byoungho Kang
'''

import numpy as np

def perceptron(X, W, bias):
    affine = np.sum(X*W) + bias
    if affine > 0:
        return 1
    elif affine <= 0:
        return 0
    
def andPerceptron(X):
    W = np.array([0.5, 0.5])
    bias = -0.7
    return perceptron(X, W, bias)

def orPerceptron(X):
    W = np.array([0.5, 0.5])
    bias = -0.2
    return perceptron(X, W, bias)

def nandPerceptron(X):
    W = np.array([-0.5, -0.5])
    bias = 0.7
    return perceptron(X, W, bias)

def xorPerceptron(X):
    tmp1 = nandPerceptron(X)
    tmp2 = orPerceptron(X)
    return andPerceptron(np.array([tmp1, tmp2]))

print(xorPerceptron(np.array([0,0])))
print(xorPerceptron(np.array([0,1])))
print(xorPerceptron(np.array([1,0])))
print(xorPerceptron(np.array([1,1])))          