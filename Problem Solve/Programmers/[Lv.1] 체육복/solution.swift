import Foundation

func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    var arr = [Int](repeating: 0, count: n)
    for i in lost {
        arr[i - 1] -= 1
    }
    for i in reserve {
        arr[i - 1] += 1
    }
    
    let reserve2 = reserve.sorted(by: <)
    for i in reserve2 {
        if arr[i - 1] == 0 {
            continue
        }
        
        if (0..<n).contains(i - 2) && arr[i - 2] == -1 {
            arr[i - 2] += 1
            arr[i - 1] -= 1
            continue
        }
        
        if (0..<n).contains(i) && arr[i] == -1 {
            arr[i - 1] -= 1
            arr[i] += 1
            continue
        }
    }
    return arr.filter { $0 >= 0 }.count
}
