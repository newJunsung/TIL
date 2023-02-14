import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let doodle = lottos.filter { $0 == 0 }.count
    let correctNum = lottos.filter { win_nums.contains($0) }.count
    
    var min = 6 - correctNum + 1
    var max = min - doodle
    
    if min > 6 {
        min = 6
    }
    if max > 6 {
        max = 6
    }
    
    return [max, min]
}

let lottos = [2, 3, 4, 100, 0, 1900]
let win_nums = [31, 10, 45, 1, 6, 19]

print(solution(lottos, win_nums))
