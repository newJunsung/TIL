import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var arr = [Bool](repeating: true, count: n + 1)
    for i in section {
        arr[i] = false
    }

    var count = 0
    for i in 1...n {
        if !arr[i] {
            count += 1
            for j in i...(i + m - 1) {
                if (1...n).contains(j) {
                    arr[j] = true
                }
            }
        }
    }
    return count
}
