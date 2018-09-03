'''
Created on 2018. 7. 27.

@author: Byoungho Kang
'''

import numpy as np
import MyLib.layers as ml
from collections import OrderedDict

class MnistNet:
    
    def __init__(self, inputSize, hiddenSize, outputSize, weightInitStd=0.01):
        self.params = {}
        self.params['W1'] = weightInitStd * np.random.randn(inputSize, hiddenSize)
        self.params['W2'] = weightInitStd * np.random.randn(hiddenSize, outputSize)
        self.params['b1'] = np.zeros(hiddenSize)
        self.params['b2'] = np.zeros(outputSize)
        
        # 계층생성
        self.layers = OrderedDict()
        self.layers['Affine1'] = ml.Affine(self.params['W1'], self.params['b1'])
        self.layers['Relu1']   = ml.Relu()
        self.layers['Affine2'] = ml.Affine(self.params['W2'], self.params['b2'])
        self.lastLayer = ml.SoftmaxWithLoss()
        
    def predict(self, x):
        for layer in self.layers.values():
            x = layer.forward(x)
        return x
    
    def loss(self, x, t):
        y = self.predict(x)
        return self.lastLayer.forward(y, t)
    
    def accuracy(self, x, t):
        y = self.predict(x)
        y = np.argmax(y, axis=1)
        t = np.argmax(t, axis=1)
        accuracy = np.sum(y==t) / float(x.shape[0])
        return accuracy
    
    def grad(self, x, t):
        #순전파
        self.loss(x, t)
        #역전파
        dout = 1
        dout = self.lastLayer.backward(dout)
        
        layers = list(self.layers.values())
        layers.reverse()
        for layer in layers:
            dout = layer.backward(dout)
            
        grad = {}
        grad['W1'] = self.layers['Affine1'].dW
        grad['b1'] = self.layers['Affine1'].db
        grad['W2'] = self.layers['Affine2'].dW
        grad['b2'] = self.layers['Affine2'].db
        
        return grad