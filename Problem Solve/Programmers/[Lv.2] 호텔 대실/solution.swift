import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var timeTable = [Int](repeating: 0, count: 24 * 61)
    for bt in book_time {
        let temp1 = bt[0].split(separator: ":").map { Int($0)! }
        let temp2 = bt[1].split(separator: ":").map { Int($0)! }
        
        let start = temp1[0] * 60 + temp1[1]
        let end = temp2[0] * 60 + temp2[1] + 10
        timeTable[start] += 1
        timeTable[end] -= 1
    }
    
    var result = 0
    for i in 1..<24*60 {
        timeTable[i] += timeTable[i - 1]
        result = max(timeTable[i], result)
    }
    return result
}
