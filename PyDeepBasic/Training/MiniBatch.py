'''
Created on 2018. 7. 25.

@author: Byoungho Kang
'''

import numpy as np
import MyLib.mnist as mnist

#1.데이터 확보 및 전처리
(trainImg, trainLbl),(testImg, testLbl) = mnist.load_mnist(normalize=True, flatten=True, one_hot_label=True)
print(trainImg.shape)
print(trainLbl.shape)
print(testImg.shape)
print(testLbl.shape)

batchSize = 10
trainSize = trainImg.shape[0]  # 60000
batchMask = np.random.choice(trainSize, batchSize)
print(batchMask)
batchImg = trainImg[batchMask]
batchLbl = trainLbl[batchMask]
print(batchLbl)
print(batchLbl.argmax(axis=1))