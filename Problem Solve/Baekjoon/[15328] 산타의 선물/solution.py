import decimal
import math
decimal.getcontext().prec = 30

tc = int(input())

def dist(x1, x2, y1, y2, z1, z2):
    return decimal.Decimal(decimal.Decimal((x1-x2)**2+(y1-y2)**2+(z1-z2)**2).sqrt())

while (tc):
    tc-=1
    time = int(input())
    x1, y1, z1 = map(int, input().split())
    x2, y2, z2 = map(int, input().split())
    x3, y3, z3 = map(int, input().split())
    x4, y4, z4 = map(int, input().split())
    res = dist(0, x1, 0, y1, 0, z1) + dist(x1, x2, y1, y2, z1, z2) + dist(x2, x3, y2, y3, z2, z3) + dist(x3, x4, y3, y4, z3, z4)
    if(time < res):
         print("NO")
    else:
        print("YES")
