'''
Created on 2018. 7. 16.

@author: Byoungho Kang
'''

'1.파이썬 함수'
def introduce(name, age, nation="korean"):
    print("Hello!, My name is %s, %d years old. I'm a %s" % (name, age, nation))
   
def beers():
    return ("카스", "칭다오", "아사히")     # 튜플을 리턴
    
introduce("강병호", 45)

(beer1, beer2, beer3) = beers()
print(beer1, type(beer1))                   # 카스 <class 'str'>
    
'2.람다 함수' 
myfunc = lambda a, b: 3*a+2*b 
print(myfunc(1,2))      # 7

funclist = [lambda a,b:a+b, lambda a,b:a-b, lambda a,b:a*b, lambda a,b:a/b]
for myfunc in funclist:
    print(myfunc(3,2))  # 5, 1, 6, 1.5

'3.내장함수'
print(abs(-1.2))                    # 절대값 : 1.2
print(bool(1))                      # bool 값 : True
print(chr(97))                      # 아스키코드값에 해당되는 문자 : a
print(dict(one=1, two=2, three=3))  # 딕셔너리 객체 생성 : {'one': 1, 'two': 2, 'three': 3}
print(float("3.14"))                # float형 객체생성 : 3.14
print(int('100'))                   # int형 객체생성 : 100
print(len('python'))                # 입력값의 길이 : 6
print(list('python'))               # 리스트 객체 생성 : ['p', 'y', 't', 'h', 'o', 'n']
print(max([1,2,3]))                 # 최대값 : 3
print(min([1,2,3]))                 # 최소값 : 1
print(pow(2,3))                     # 거듭제곱 : 8
print(list(range(0,50,10)))         # 0부터 49까지 10씩 증가하면서 리스트 생성 : [0, 10, 20, 30, 40]
print(round(1.2345, 2))             # 소수점 둘째자리에서 반올림 : 1.23
print(sorted([3,1,2]))              # 입력값을 정렬 후 결과를 리스트로 리턴 : [1, 2, 3]
print(str(3.14))                    # 문자열객체로 반환 : 3.14
print(sum([1,2,3]))                 # 합계 : 6
print(tuple('python'))              # 튜플객체 생성 : ('p', 'y', 't', 'h', 'o', 'n')
print(type("python"))               # 객체 타입을 반환 : <class 'str'>

a = "I love you"
print(a.count('o'))                 # 문자갯수세기 : 2
print(a.replace("you", "her"))      # 문자열 치환 : I love her
print(a.upper())                    # 대문자 변환 : I LOVE YOU


'4.클래스와 객체'
class Calculator:
    def __init__(self):
        self.result = 0

    def add(self, num):
        self.result += num
        return self.result
    
    def subtract(self, num):
        self.result -= num
        return self.result

cal1 = Calculator()

print(cal1.add(3))          # 3
print(cal1.add(4))          # 7     
print(cal1.subtract(2))     # 5     

