'''
Created on 2018. 7. 18.

@author: Byoungho Kang
'''

import numpy as np
import matplotlib.pyplot as plt

# 데이터 준비
X = np.arange(0, 6, 0.1)    # 0에서 6까지 0.1 간격으로 생성
Y1 = np.sin(X)
Y2 = np.cos(X)

# 한글처리
plt.rc('font',family='Malgun Gothic')
plt.rc('axes',unicode_minus=False)

# 그래프 그리기
plt.plot(X, Y1, color="magenta", label="sin", linestyle="dashed", linewidth=2.5)
plt.plot(X, Y2, c="yellow", label="cos", ls="dashdot", lw=1.5)
plt.xlabel("x")
plt.ylabel("y")
plt.title("삼각함수 그래프")
plt.legend()

# 화면에 출력
plt.show()

# 예제) 프로듀스 시즌 1 Top 3 순위변동차트
somi    = (1, 1, 1, 2, 4, 4, 1, 1)
sejeong = (2, 2, 2, 1, 1, 1, 2, 2)
yujeong = (11,13,8, 3, 2, 2, 3, 3)

# x축
xs = [i for i,_ in enumerate(somi)]
print(xs)

plt.plot(xs, somi   , 'g-', label="소미")
plt.plot(xs, sejeong, 'r-', label="세정")
plt.plot(xs, yujeong, 'b-', label="유정")

plt.axis([-0.5, 7.5, 14, 0])
plt.xticks(xs, ['1회', '2회', '3회', '5회', '6회', '8회', '10회', '11회'])
plt.xlabel("순위 선정 회차")
plt.ylabel("순위")
plt.title("프로듀스 시즌 1 Top 3 순위변동차트")
plt.legend()
plt.show()