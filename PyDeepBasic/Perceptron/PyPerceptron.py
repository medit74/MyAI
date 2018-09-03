'''
Created on 2018. 7. 23.

@author: Byoungho Kang
'''

def perceptron(x1, x2, w1, w2, theta):
    affine = x1*w1 + x2*w2
    if affine > theta:
        return 1
    elif affine <= theta:
        return 0
    
def andPerceptron(x1, x2):
    w1, w2, theta = 0.5, 0.5, 0.7
    return perceptron(x1, x2, w1, w2, theta)

def orPerceptron(x1, x2):
    w1, w2, theta = 0.5, 0.5, 0.2
    return perceptron(x1, x2, w1, w2, theta);

print(andPerceptron(0,0))
print(andPerceptron(0,1))
print(andPerceptron(1,0))
print(andPerceptron(1,1))

print(orPerceptron(0,0))
print(orPerceptron(0,1))
print(orPerceptron(1,0))
print(orPerceptron(1,1))
