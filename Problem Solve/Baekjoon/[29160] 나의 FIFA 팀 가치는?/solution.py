import heapq

(n, k) = map(int, input().split())
positions = [[], [], [], [], [], [], [], [], [], [], []]

for _ in range(0, n):
    (p, w1) = map(int, input().split())
    heapq.heappush(positions[p - 1], -w1)

for i in range(0, 11):
    if len(positions[i]) == 0:
        continue
    for j in range(0, k):
        w2 = -heapq.heappop(positions[i])
        if w2 > 0:
            w2 -= 1
        heapq.heappush(positions[i], -w2)

result = 0
for i in range(0, 11):
    if len(positions[i]) == 0:
        continue
    result += (-heapq.heappop(positions[i]))
print(result)