'''
Created on 2018. 7. 13.

@author: Byoungho Kang
'''

'1.변수선언'
counter = 100           # An integer assignment
miles   = 1000.0        # A floating point
name    = "John"        # A string

print(counter)
print(miles)
print(name)

'2.숫자형'
a = 123                 # int
a = 0o12                # int
a = 0xFF                # int
print(type(a))
a = 1.23                # float
a = 3.4e10              # float
print(type(a))
a = complex(1,2j)       # complex
print(type(a))

print(7/4)              # 1.75
print(7//4)             # 1
print(7%4)              # 3

'3.문자열'
print('Hello')
print("What's your name")
print('"My name is Tiger" he said')
print("Life is too short.\nYou need python")
print("I've been to %d countries." % 15)
print("%s is the best country in %d" % ("Swiss", 15))

'4.Bool형'
a = True
b = False
print(2>1)              # True
print(type(a))

'5.리스트형'
odd = [1, 3, 5, 7, 9]
print(odd[0])           # 1
print(odd[-1])          # 9
print(odd[1:3])         # [3,5]
print(odd[:3])          # [1,3,5]
print(odd[3:])          # [7,9]

mylist = ['my','python','list']
print(mylist, type(mylist))   # ['my', 'python', 'list'] <class 'type'>
mylist.append("added")
print(mylist)               # ['my', 'python', 'list', 'added']
mylist.remove('python')
print(mylist)               # ['my', 'list', 'added']
mylist.sort()
print(mylist)               # ['added', 'list', 'my']

'6.튜플형'
t1 = (1, 2, 'a', 'b')
t2 = (3, 4)
print(t1[0])    # 1
print(t1[-2:])  # ('a', 'b')
print(t1+t2)    # (1, 2, 'a', 'b', 3, 4)
print(t2*2)     # (3, 4, 3, 4)

'7.디셔너리'
dict1 = {'name': '강병호', 'co': 'SK', 'birth': '1128'}
print(dict1.get('name'))    # 강병호
dict1['addr'] = '성남시'
print(dict1)                # {'name': '강병호', 'co': 'SK', 'birth': '1128', 'addr': '성남시'}
del dict1['birth']
print(dict1)                # {'name': '강병호', 'co': 'SK', 'addr': '성남시'}
dict1['co'] = 'SK주식회사'
print(dict1)                # {'name': '강병호', 'co': 'SK주식회사', 'addr': '성남시'}

'8.집합'
set1 = set([1,1,2,3,5,8])
print(set1)             # {1, 2, 3, 5, 8}
set2 = set("Hello")
print(set2)             # {'e', 'o', 'H', 'l'}

s1 = set([1, 2, 3, 4, 5, 6])
s2 = set([4, 5, 6, 7, 8, 9])
print(s1 & s2)          # 교집합 {4, 5, 6}    
print(s1 | s2)          # 합집합 {1, 2, 3, 4, 5, 6, 7, 8, 9}
print(s1 - s2)          # 차집합 {1, 2, 3}