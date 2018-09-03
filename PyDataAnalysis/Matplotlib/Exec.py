'''
Created on 2018. 7. 19.

@author: Byoungho Kang
'''

import numpy as np
import matplotlib.pyplot as plt

def sigmoid(x):
    return 1/(1+np.exp(-x))

X = np.arange(-10, 10, 0.1)
Y = sigmoid(X)

plt.plot(X, Y, label="sigmoid", c="blue", ls="dotted")
plt.xlabel("x")
plt.ylabel("y")
plt.title("Activation function")
plt.legend()

plt.show()