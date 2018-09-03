'''
Created on 2018. 7. 24.

@author: Byoungho Kang
'''

import pickle
import numpy as np
import matplotlib.pyplot as plt
import MyLib.mnist as mnist

#1.데이터 확보 및 전처리
(trainImg, trainLbl),(testImg, testLbl) = mnist.load_mnist(normalize=False, flatten=True, one_hot_label=False)
print(trainImg.shape)
print(trainLbl.shape)
print(testImg.shape)
print(testLbl.shape)

#2.신경망 초기화
with open("../resources/sample_weight.pkl","rb") as f:
    network = pickle.load(f)
W1, W2, W3 = network['W1'], network['W2'], network['W3']
b1, b2, b3 = network['b1'], network['b2'], network['b3']
print(W1.shape)
print(W2.shape)
print(W3.shape)
print(b1.shape)
print(b2.shape)
print(b3.shape)

#3.추론
def sigmoid(X):
    return 1/(1+np.exp(-X))

def softmax(X):
    expX = np.exp(X - np.max(X))
    sumExpX = np.sum(expX)
    return expX / sumExpX

#3-1. 한 건씩 처리
accuracyCnt = 0
print(len(trainImg))
for idx in range(len(trainImg)):
    X  = trainImg[idx]
    Z1 = sigmoid(np.dot(X, W1) + b1)
    Z2 = sigmoid(np.dot(Z1, W2) + b2)
    Y  = softmax(np.dot(Z2, W3) + b3)
    p = np.argmax(Y)
    if p == trainLbl[idx]:
        accuracyCnt += 1

print(accuracyCnt)
print(accuracyCnt / len(trainImg))

#3-2. 배치처리 처리
batchSize = 100
accuracyCnt = 0
print(len(trainImg))
for idx in range(0, len(trainImg), batchSize):
    X  = trainImg[idx:idx+batchSize]
    Z1 = sigmoid(np.dot(X, W1) + b1)
    Z2 = sigmoid(np.dot(Z1, W2) + b2)
    Y  = softmax(np.dot(Z2, W3) + b3)
    p = np.argmax(Y, axis=1)
    accuracyCnt += np.sum(p == trainLbl[idx:idx+batchSize])

print(accuracyCnt)
print(accuracyCnt / len(trainImg))

#4.이미지 시각화
img = trainImg[0].reshape(28,28)
lbl = trainLbl[0]
plt.imshow(img, cmap="gray")
plt.title("Label is %d" % lbl)
plt.show()
