'''
Created on 2018. 7. 16.

@author: Byoungho Kang
'''

f = open("./myfile.txt", "w")
for idx in range(1, 6):
    data = "%d번째 줄입니다.\n" % idx
    f.write(data)
f.close()

f = open("./myfile.txt", "r")
data = f.read()
print(data)
f.close()

with open("./myfile.txt", "r") as f:
    data = f.read()
    print(data)