stack = []
sum = 0
i = int(input())
for _ in range(i):
    num = int(input())
    if num == 0:
        sum -= stack.pop()
        continue
    stack.append(num)
    sum += num

print(sum)