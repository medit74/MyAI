'''
Created on 2018. 7. 17.

@author: Byoungho Kang
'''

import numpy as np

a = np.array([[1,2],[3,4]])     # 파이썬 리스트를 이용하여 ndarray 객체생성

print(a.shape)  # (2,2)
print(a.ndim)   # 2
print(a.size)   # 4
print(a.dtype)  # int32
print(type(a))  # <class 'numpy.ndarray'>