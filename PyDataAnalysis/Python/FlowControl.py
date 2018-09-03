'''
Created on 2018. 7. 16.

@author: Byoungho Kang
'''

import time

localtime = time.localtime(time.time())
print(localtime)                # 현재 날짜 및 시간
localhour = localtime.tm_hour
print(localhour)                # 현재 시간

'1.제어문'
greeting = ""
if localhour >= 6 and localhour < 11:
    greeting = "Good Morning"
elif localhour >= 11 and localhour < 17:
    greeting = "Good Afternoon"
elif localhour >= 17 and localhour < 22:
    greeting = "Good Evening"
else:
    greeting = "Hello"
print(greeting)

'2.while 반복문'
total = 0
count = 1
while count <= 10 :
    total += count
    count += 1
print(count)    # 11
print(total)    # 1에서 10까지의 합 : 55    

total = 0
count = 1
while count <= 10 :
    total += count
    if total > 10 :
        break
    count += 1
print(count)    # 5
print(total)    # total이 10이 넘어가 첫 번째 수: 15

total = 0
count = 0
while count <= 10 :
    count += 1
    if count % 2 == 1 :
        continue 
    total += count
print(count)    # 11
print(total)    # 1에서 10까지 짝수의 합 : 30

'3.for반복문'
list1 = ['apple','banana','mango']
for item in list1:
    print(item)             # apple, banana, mango
    
list2 = [(1,2),(3,4),(5,6)]
for (a, b) in list2:
    print(a + b)            # 3, 7, 11

total = 0
for idx in range(1,5):
    total += idx
print(total)                # 1에서 4까지의 합 : 10

for idx in range(len(list1)):
    print('과일 %d번은 %s입니다.' % (idx, list1[idx])) # 과일 0번은 apple입니다...