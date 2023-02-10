import Foundation

func solution(_ array:[Int]) -> Int {
    var answer = 0
    
    array
        .map { String($0) }
        .forEach { str in
            answer = answer + str.filter { $0 == "7" }.count
        }
    
    return answer
}
