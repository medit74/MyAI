'''
Created on 2018. 7. 30.

@author: Byoungho Kang
'''

class AddLayer:
    
    def __init__(self):
        pass        # 아무것도 하지말 것.
    
    def forward(self, x, y):
        return x+y
    
    def backward(self, dout):
        dx = dout * 1
        dy = dout * 1
        return dx, dy
    
class MulLayer:
    
    def __init__(self):
        self.x = None   # 순전파의 입력값을 유지
        self.y = None
        
    def forward(self, x, y):
        self.x = x 
        self.y = y 
        return x*y 

    def backward(self, dout):
        dx = dout*self.y 
        dy = dout*self.x 
        return dx, dy

# 입력값    
applePrice = 100
orangePrice = 150
appleCnt = 2
orangeCnt = 3
tax = 1.1

# 계산그래프 설계
appleLayer = MulLayer()
orangeLayer = MulLayer()
sumLayer = AddLayer()
taxLayer = MulLayer()

# 순전파
appleTotal = appleLayer.forward(applePrice, appleCnt)
orangeTotal = orangeLayer.forward(orangePrice, orangeCnt)
total = sumLayer.forward(appleTotal, orangeTotal)
totalWithTax = taxLayer.forward(total, tax)
print(appleTotal, orangeTotal, total, totalWithTax)

# 역전파
dout = 1
dsum, dtax = taxLayer.backward(dout)
dappleTotal, dorangeTotal = sumLayer.backward(dsum)
dapplePrice, dappleCnt = appleLayer.backward(dappleTotal)
dorangePrice, dorangeCnt = orangeLayer.backward(dorangeTotal)
print(dsum, dtax, dappleTotal, dorangeTotal)
print(dapplePrice, dappleCnt, dorangePrice, dorangeCnt)
