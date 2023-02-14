def solution(lottos, win_nums):
    answer = []
    check = 0
    masterKey = lottos.count(0)

    for i in range(0, 6):
        for j in range(0, 6):
            if(lottos[i] == win_nums[j]):
                check += 1

    highest = 7 - (check + masterKey)
    lowest = 7 - check
    if highest == 7:
        highest = 6
    if lowest == 7:
        lowest = 6

    answer.append(highest)
    answer.append(lowest)

    return answer
