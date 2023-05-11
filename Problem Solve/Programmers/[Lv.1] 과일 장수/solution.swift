import Foundation

func solution(_ k:Int, _ m:Int, _ score:[Int]) -> Int {
    var sortedScore = score.sorted(by: >)
    
    let remains = score.count % m
    for _ in 0..<remains {
       let _ = sortedScore.removeLast()
    }

    var sum = 0
    for i in stride(from: 0, to: sortedScore.count, by: m) {
        let tempM = i + (m - 1)
        let minNum = sortedScore[i...tempM].min()!
        sum += minNum * m
    }

    return sum
}
