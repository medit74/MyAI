'''
Created on 2018. 7. 18.

@author: Byoungho Kang
'''

import numpy as np

'1.단항 유니버설함수'
a = np.arange(1, 6)

print(a)
print(np.sqrt(a))
print(np.square(a))
print(np.exp(a))
print(np.log(a))
print(np.sin(a))
print(np.tanh(a))

'2.이항 유니버설함수'
a1 = np.array([2,3,4])
a2 = np.array([1,5,2])
print(np.maximum(a1, a2))
print(np.minimum(a1, a2))

'3.통계 함수'
a = np.array([[6,2,4,8,2,4],[-7,3,4,-1,9,0]])
print(a)
print(np.sum(a))
print(np.mean(a))
print(np.min(a))
print(np.max(a))
print(np.argmin(a))
print(np.argmax(a))

print(np.sum(a, axis=0))
print(np.mean(a, axis=0))
print(np.argmax(a, axis=0))
print(np.argmax(a, axis=1))