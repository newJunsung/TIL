order = []
n = int(input())
for n in range(0, n):
    order.append(input())

for o in order:
    check = 0
    for ps in o:
        if ps == "(":
            check += 1
        else:
            check -= 1
        if check < 0:
            break
    if check == 0:
        print("YES")
    else:
        print("NO")