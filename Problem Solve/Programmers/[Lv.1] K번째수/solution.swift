import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer = [Int]()
    
    for command in commands {
        let i = command[0] - 1, j = command[1] - 1, k = command[2] - 1
        let sortedArr = array[i...j].sorted(by: <)
        answer.append(sortedArr[k])
    }
    
    return answer
}
