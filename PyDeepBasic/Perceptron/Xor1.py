'''
Created on 2018. 7. 23.

@author: Byoungho Kang
'''

import numpy as np

def perceptron(X, W, theta):
    affine = np.sum(X*W)
    if affine > theta:
        return 1
    elif affine <= theta:
        return 0
    
def neuron1_1(X):
    W = np.array([0.6, 0.6])
    theta = 1
    return perceptron(X, W, theta)
    
def neuron1_2(X):
    W = np.array([1.2, 1.2])
    theta = 1
    return perceptron(X, W, theta)    

def neuron2(X):
    W = np.array([-1.2, 1.2])
    theta = 1
    return perceptron(X, W, theta)    

def xorPerceptron(X):
    tmp1 = neuron1_1(X)
    tmp2 = neuron1_2(X)
    return neuron2(np.array([tmp1, tmp2]))

print(xorPerceptron(np.array([0,0])))
print(xorPerceptron(np.array([0,1])))
print(xorPerceptron(np.array([1,0])))
print(xorPerceptron(np.array([1,1])))          