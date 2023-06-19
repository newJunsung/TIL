import re

def solution(str1, str2):
    str1 = (str1.lower())
    str2 = (str2.lower())
    tmp1 = []
    tmp2 = []
    inter = 0
    uni = 0

    check = re.compile('[^a-z]')

    for i in range(0, len(str1)-1):
        if check.search(str1[i]) or check.search(str1[i+1]):
            continue
        tmp1.append(str1[i:i+2])
        
    for i in range(0, len(str2)-1):
        if check.search(str2[i]) or check.search(str2[i+1]):
            continue
        tmp2.append(str2[i:i+2])

    if len(tmp1) > len(tmp2):
        uni = len(tmp1)
        for i in range(0, len(tmp2)):
            if not tmp2[i] in tmp1:
                uni+=1
            else:
                del tmp1[tmp1.index(tmp2[i])]
                inter+=1
    else:
        uni = len(tmp2)
        for i in range(0, len(tmp1)):
            if not tmp1[i] in tmp2:
                uni+=1
            else:
                del tmp2[tmp2.index(tmp1[i])]
                inter += 1

    if uni == 0:
        cal = 1
    else:
        cal = (inter)/(uni)

    answer = int(cal * 65536)
    return answer
