import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var arr = [Int](repeating: 0, count: number + 1)
    for i in (1...number) {
        for j in stride(from: i, through: number, by: i) {
            arr[j] += 1
        }
    }
    
    var sum = 0
    arr.forEach {
        if $0 > limit {
            sum += power
        } else {
            sum += $0
        }
    }
    
    return sum
}
