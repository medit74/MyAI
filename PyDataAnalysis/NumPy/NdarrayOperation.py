'''
Created on 2018. 7. 18.

@author: Byoungho Kang
'''

import numpy as np

'1.산술연산'
a1 = np.arange(1,5).reshape(2,2)
a2 = np.arange(5,9).reshape(2,2)

print(a1)
print(a2)

print(a1+a2)
print(a1-a2)
print(a1*a2)
print(a1/a2)

print(a1**2)
print(a1>2)

'2.내적'
a1 = np.arange(1,5).reshape(2,2)
a2 = np.arange(5,9).reshape(2,2)
a3 = np.arange(1,7).reshape(2,3)
a4 = np.arange(5,11).reshape(3,2)

print(a1)
print(a2)
print(a3)
print(a4)

print(np.dot(a1, a2))
print(np.dot(a3, a4))

'3.브로드캐스팅'
a1 = np.arange(0,12).reshape(4,3)
b1 = np.arange(0,3)
b2 = np.arange(0,4).reshape(4,1)

print(a1)
print(b1)
print(b2)

print(a1+b1)
print(a1+b2)