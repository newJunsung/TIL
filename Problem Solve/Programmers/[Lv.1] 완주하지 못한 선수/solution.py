def solution(participant, completion):
    if(len(participant) == len(completion)):
        return "none"
    
    participant.sort()
    completion.sort()
    
    for i in range(0, len(completion)):
        if completion[i] != participant[i]:
            return participant[i]

    return participant[-1]
    
participant = ["marina", "josipa", "nikola", "vinko", "filipa"]
completion = ["josipa", "filipa", "marina", "nikola"]
print(solution(participant, completion))