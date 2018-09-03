'''
Created on 2018. 7. 16.

@author: Byoungho Kang
'''

'문제1'
result = 0
for n in range(1, 1000):
    if n % 3 == 0 or n % 5 == 0: 
        result += n
print(result)

'문제2'
def getavg(data):
    total = 0
    for val in data:
        total += val
    return total/len(data)

print(getavg((1,2,3,4,5)))
print(getavg((154, 709, 406))) 

'문제3'
f = open("./test1.txt","r")
body = f.read()
f.close()

body = body.replace("Japan","China")
with open("./test2.txt","w") as f:
    f.write(body)
