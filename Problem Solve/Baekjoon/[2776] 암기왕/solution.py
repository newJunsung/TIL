for _ in range(int(input())):
    N = int(input())
    note1 = set(map(int, input().split()))
    
    M = int(input())
    note2 = list(map(int, input().split()))
    
    for n in note2:
        print(1 if n in note1 else 0)
