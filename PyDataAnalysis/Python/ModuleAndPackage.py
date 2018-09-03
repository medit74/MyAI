'''
Created on 2018. 7. 16.

@author: Byoungho Kang
'''

import Python.ModuleDef as md
import sys, os
import time, calendar
import random
import pickle

cal1 = md.Calculator()
print(cal1.add(5))
print(cal1.subtract(2))

print(sys.path)
print(os.environ)
print(os.environ['PATH'])
print(os.getcwd())

print(time.time())
localtime = time.localtime(time.time())
print(localtime)
print(time.strftime('%Y.%m.%d %X', localtime))
print(calendar.prmonth(localtime.tm_year, localtime.tm_mon))

print(random.random())
print(random.randint(-10,10))
data = [-3, -2, -1, 0, 1, 2, 3]
print(random.choice(data))
random.shuffle(data)
print(data)

dict1 = {'name': '강병호', 'co': 'SK', 'birth': '1128'}
f = open("./pickle.txt", "wb")
pickle.dump(dict1, f)
f.close()
f = open("./pickle.txt", "rb")
dict2 = pickle.load(f)
print(dict2)
