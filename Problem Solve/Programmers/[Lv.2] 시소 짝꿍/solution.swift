import Foundation

func solution(_ weights:[Int]) -> Int64 {
    var mWeight = [Int64](repeating: 0, count: 4001)
    var sWeight = [Int64](repeating: 0, count: 1001)
    
    var count: Int64 = 0
    for w in weights {
        for i in 2...4 {
            count += mWeight[i * w]
            mWeight[i * w] += 1
        }
        
        if sWeight[w] > 0 {
            count -= sWeight[w] * 2
        }
        sWeight[w] += 1
    }
    return count
}

print(solution([100,200,200,100,300, 300]))
