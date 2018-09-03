'''
Created on 2018. 7. 26.

@author: Byoungho Kang
'''

import numpy as np

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

def gradDescent(f, initX, lr, step=100):
    x = initX
    for i in range(step):
        # print(x)
        x -= lr*grad(f, x)
    print(x)    
    return x 

def sFunc2(x):
    return x[0]**2 + x[1]**2

initX = np.array([-3.0, 4.0])
finalX = gradDescent(sFunc2, initX, 0.0001)

initX = np.array([-3.0, 4.0])
finalX = gradDescent(sFunc2, initX, 0.1)

initX = np.array([-3.0, 4.0])
finalX = gradDescent(sFunc2, initX, 10)

