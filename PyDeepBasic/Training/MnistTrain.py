'''
Created on 2018. 7. 27.

@author: Byoungho Kang
'''

import numpy as np
from MyLib.mnist import load_mnist
from Training.MnistNet import MnistNet

#1.데이터 확보 및 전처리
(trainImg, trainLbl),(testImg, testLbl) = load_mnist(one_hot_label=True)

#2.신경망 초기화
network = MnistNet(784, 50, 10)

#3.하이퍼파라미터 초기화
itersNum = 1000
learningRate = 0.1
batchSize = 100
trainSize = trainImg.shape[0] 

#4.학습진행현황 기록변수
trainLossList = []

print("-- 학습 시작 --")
# 학습
for i in range(itersNum):
    # 미니배치
    miniBatchMask = np.random.choice(trainSize, batchSize)
    trainImgBatch = trainImg[miniBatchMask]
    trainLblBatch = trainLbl[miniBatchMask]
    # 기울기계산
    grad = network.grad(trainImgBatch, trainLblBatch)
    # 매개변수갱신
    for key in ('W1', 'W2', 'b1', 'b2'):
        network.params[key] -= learningRate*grad[key]
    # 손실합수의 값 기록
    loss = network.loss(trainImgBatch, trainLblBatch)
    trainLossList.append(loss)
    print("iteration %d 손실 값: %f" % (i, loss))

print("-- 학습 종료 --")
    
    