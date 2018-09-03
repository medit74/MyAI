'''
Created on 2018. 7. 16.

@author: Byoungho Kang
'''
class Calculator:
    def __init__(self):
        self.result = 0

    def add(self, num):
        self.result += num
        return self.result
    
    def subtract(self, num):
        self.result -= num
        return self.result
    
if __name__ == "__main__":
    print("직접 이 파일을 실행하셨습니다.")