'''
Created on 2018. 7. 26.

@author: Byoungho Kang
'''

import numpy as np
import matplotlib.pyplot as plt

def diff(f, x):
    h = 1e-4
    return (f(x+h)-f(x-h))/(2*h)

def sFunc1(x):
    return 0.01*x**2 +0.1*x

X = np.arange(0, 20, 0.1)
Y = sFunc1(X)
plt.xlabel("x")
plt.ylabel("f(x)")
plt.plot(X, Y)
plt.show()

print(diff(sFunc1, 5))
print(diff(sFunc1, 10))

def grad(f, x):
    h = 1e-4
    grad = np.zeros_like(x)     # x와 같은 형상의 배열
    
    for idx in range(x.size):
        tmp = x[idx]
        
        x[idx] = tmp+h
        fx1 = f(x)              # f(x+h)
        
        x[idx] = tmp-h
        fx2 = f(x)              # f(x-h)
        
        grad[idx] = (fx1-fx2)/(2*h)
        x[idx] = tmp            # 원래 값으로
    
    return grad

def sFunc2(x):
    return x[0]**2 + x[1]**2

print(grad(sFunc2, np.array([3.0, 4.0])))
print(grad(sFunc2, np.array([0.0, 2.0])))
print(grad(sFunc2, np.array([3.0, 0.0])))