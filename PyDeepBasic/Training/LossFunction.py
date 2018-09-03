'''
Created on 2018. 7. 25.

@author: Byoungho Kang
'''

import numpy as np

def meanSquaredError(Y, T):
    return ((Y-T)**2).mean()

def crossEntropyError(Y, T):
    delta = 1e-7
    if Y.ndim == 1:
        T = T.reshape(1, T.size)
        Y = Y.reshape(1, Y.size)
        
    batchSize = Y.shape[0]
    return -np.sum(T*np.log(Y+delta)) / batchSize    
    # return -np.sum(T*np.log(Y+delta))
    
# 정답은 '2'
T = np.array([0, 0, 1, 0, 0, 0, 0, 0, 0, 0])

# '2'일 확률이 가장 높음.
Y = np.array([0.1, 0.1, 0.6, 0, 0.1, 0.1, 0, 0, 0, 0])
print('정답인 경우 평균제곱오차 %f' % meanSquaredError(Y, T))
print('정답인 경우 교차엔트로피 %f' % crossEntropyError(Y, T))

# '4'일 확률이 가장 높음.
Y = np.array([0.1, 0.0, 0.1, 0, 0.7, 0.1, 0, 0, 0, 0])
print('오답인 경우 평균제곱오차 %f' % meanSquaredError(Y, T))
print('오답인 경우 교차엔트로피 %f' % crossEntropyError(Y, T))
