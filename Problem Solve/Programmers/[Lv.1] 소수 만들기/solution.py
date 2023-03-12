def solution(nums):
    answer = 0

    tmp = []
    for a in range(0, len(nums)-2):
        for b in range(a+1, len(nums)-1):
            for c in range(b+1, len(nums)):
                tmp.append(nums[a]+nums[b]+nums[c])
    
    print(len(tmp))
    print(tmp)

    for i in tmp:
        answer += 1
        for div in range(2, int(i/2)):
            if i % div == 0:
                answer -= 1
                break
            
    return answer

# print(solution(nums=[1,2,6,7,4]))