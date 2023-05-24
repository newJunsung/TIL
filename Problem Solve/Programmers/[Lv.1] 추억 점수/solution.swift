import Foundation

func solution(_ name:[String], _ yearning:[Int], _ photo:[[String]]) -> [Int] {
    var answer = [Int]()
    var points = [String:Int]()
    for i in 0..<name.count {
        points[name[i]] = yearning[i]
    }
    
    for pho in photo {
        var temp = 0
        for p in pho {
            if let point = points[p] {
                temp += point
            }
        }
        answer.append(temp)
    }
    
    return answer
}
