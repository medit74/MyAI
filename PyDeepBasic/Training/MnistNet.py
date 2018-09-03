'''
Created on 2018. 7. 27.

@author: Byoungho Kang
'''

import numpy as np
import MyLib.functions as mf
import MyLib.gradient as mg

class MnistNet:
    
    def __init__(self, inputSize, hiddenSize, outputSize, weightInitStd=0.01):
        self.params = {}
        self.params['W1'] = weightInitStd * np.random.randn(inputSize, hiddenSize)
        self.params['W2'] = weightInitStd * np.random.randn(hiddenSize, outputSize)
        self.params['b1'] = np.zeros(hiddenSize)
        self.params['b2'] = np.zeros(outputSize)
        
    def predict(self, x):
        z = mf.sigmoid(np.dot(x, self.params['W1']) + self.params['b1'])
        y = mf.softmax(np.dot(z, self.params['W2']) + self.params['b2'])
        return y
    
    def loss(self, x, t):
        y = self.predict(x)
        return mf.cross_entropy_error(y, t)
    
    def accuracy(self, x, t):
        y = self.predict(x)
        y = np.argmax(y, axis=1)
        t = np.argmax(t, axis=1)
        accuracy = np.sum(y==t) / float(x.shape[0])
        return accuracy
    
    def grad(self, x, t):
        lossW = lambda W : self.loss(x, t)
        grad = {}
        grad['W1'] = mg.numerical_gradient(lossW, self.params['W1'])
        grad['W2'] = mg.numerical_gradient(lossW, self.params['W2'])
        grad['b1'] = mg.numerical_gradient(lossW, self.params['b1'])
        grad['b2'] = mg.numerical_gradient(lossW, self.params['b2'])
        return grad
