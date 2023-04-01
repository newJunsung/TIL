n = int(input())
rope = []
weight = []

for _ in range(0, n):
    rope.append(int(input()))
rope.sort()

for r in rope:
    weight.append(r*n)
    n -= 1
print(max(weight))
