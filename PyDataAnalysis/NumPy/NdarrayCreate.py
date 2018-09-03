'''
Created on 2018. 7. 17.

@author: Byoungho Kang
'''

import numpy as np

'1. ndarray 생성'
a = np.arange(-3, 3, 0.5)
print(a)
print(a.shape, a.ndim, a.size, a.dtype)

b = np.zeros((2,3), dtype=np.float16)
print(b)
print(b.shape, b.ndim, b.size, b.dtype)

c = np.ones_like(b, dtype=np.int8)
print(c)
print(c.shape, c.ndim, c.size, c.dtype)

'2. numpy.random 으로 ndarray 생성'
a = np.random.normal(size=(4,4))
print(a)
print(a.shape, a.ndim, a.size, a.dtype)

b = np.random.randn(2,4)
print(b)
print(b.shape, b.ndim, b.size, b.dtype)

c = np.random.randint(0, 10)
print(c, type(c))

print(np.random.choice(100, 5))         # 0에서 100 사이의 랜덤 수 5개 추출
print(np.random.randint(0, 100, 5))     # 0에서 100 사이의 랜덤 수 5개 추출

'3. Shape 변경, Dtype변경, 전치행렬'
a = np.arange(6).reshape(2,3)
print(a)
print(a.shape, a.ndim, a.size, a.dtype)

b = a.flatten()
print(b)
print(b.shape, b.ndim, b.size, b.dtype)

c = a.transpose()
print(c)
print(c.shape, c.ndim, c.size, c.dtype)

d = np.array([True, False, True])
print(d, d.dtype)
print(d.astype(np.int))

'4. 1차원 배열 인덱싱과 슬라이싱'
a = np.arange(10)
print(a)            
print(a[2])         # 2번 항목
print(a[3:5])       # 3~4번 항목
print(a[:8:2])      # 0~7번 항목 중 2번째 마다
print(a[::-1])      # 전체항목 중 1씩 감소할때 마다

print(a)
a_slice = a[3:5]
a_slice[:] = -1
print(a)

'5. 다차원 배열 인덱싱과 슬라이싱'
a = np.arange(1,21,1).reshape(4,5)
print(a)
print(a[2,3])
print(a[0:4,1])
print(a[1,])
print(a[-1,])

b = np.arange(1,25).reshape(2,3,4)
print(b)
print(b[0])