'''
Created on 2018. 7. 19.

@author: Byoungho Kang
'''

import matplotlib.pyplot as plt

# 한글처리
plt.rc('font',family='Malgun Gothic')
plt.rc('axes',unicode_minus=False)

# 이미지 데이터
img = plt.imread("saturn.png")
print(type(img), img.shape)  # <class 'numpy.ndarray'>

# 이미지 그리기
plt.imshow(img)
plt.title("Saturn")

# 화면에 출력
plt.show()

# Bar Plot
# 데이타
people = ('소미','세정','유정','청하','소혜','결경','채연','도연','미나','나영','연정')
scores = (858333,525352,438778,403633,229732,218338,215338,200069,173762,138726,136780)

# 그래프
xs = [i for i,_ in enumerate(people)]

plt.bar(xs, scores, facecolor='#9999ff', edgecolor='white')
plt.xticks(xs, people)
plt.ylabel('득표 수')
plt.title('프로듀스 시즌 1 최종 득표 수')
plt.show()

# 히스토그램
# 임의 50명 연령
data = (22, 45, 23, 42, 9, 41, 28, 33, 32, 61, 11, 19, 20, 42, 12, 42, 72, 66, 52, 42,
        22, 42, 52, 44, 61, 2, 48, 52, 81, 79, 24, 19, 11, 22, 29, 43, 35, 52, 13, 42,
        32, 39, 28, 16, 19, 19, 8, 39, 29)

# x축
bins = [x*10 for x in range(11)]
print(bins)   # [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
plt.hist(data, bins, rwidth=0.8, facecolor="#ff9999")

plt.ylabel('인원')
plt.title('연령대별 합계')
plt.show()

# Scatter
people = ('소미','세정','유정','청하','소혜','결경','채연','도연','미나','나영','연정')
scores = (858333,525352,438778,403633,229732,218338,215338,200069,173762,138726,136780)
search = (432800,607000,400500,201300,454900,340600,912800,236000,52800 ,167700,96000 )

plt.scatter(scores, search)
# Point에 Label추가 (label을 Point 근처에서 약간 떨어지게)
for people, scores_cnt, search_cnt in zip(people, scores, search):
    plt.annotate(people, xy=(scores_cnt, search_cnt), xytext=(5, 0), textcoords='offset points')

plt.axis([0, 1000000, 0, 1000000])
plt.title("최종득표수 대비 검색량")
plt.xlabel("최종득표수")
plt.ylabel("검색량")
plt.show()