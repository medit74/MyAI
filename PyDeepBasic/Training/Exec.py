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

def gradDescent(f, initX, lr, step=20):
    x = initX
    for i in range(step):
        print(x)
        x -= lr*grad(f, x)
    print(x)    
    return x 

def sFunc(x):
    return 5*(x[0]**3) + 3*(x[1]**2) + 7*x[2]

initX = np.array([2.0, 3.0, 4.0])
print("초기값 X : " , initX)
print("초기값 f(X) : ", sFunc(initX))
print("초기값 기울기 : " , grad(sFunc, initX))
print("===== 경사하강법 시작 =====")
finalX = gradDescent(sFunc, initX, 0.05)
print("===== 경사하강법 종료 =====")
print("이동된 값 X : ", finalX)
print("이동된 값 f(X) : ", sFunc(finalX))
print("이동후 기울기: " , grad(sFunc, finalX))

