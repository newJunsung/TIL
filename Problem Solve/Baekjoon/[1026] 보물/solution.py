n = int(input())

aArr = input().split(" ")
bArr = input().split(" ")
aArr = list(map(int, aArr))
bArr = list(map(int, bArr))

sum = 0

aArr.sort(reverse=True)
bArr.sort()
for i in range(n):
    sum += (int(aArr[i]) * int(bArr[i]))

print(sum)
