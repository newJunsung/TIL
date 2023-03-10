import Foundation

var answer = ""
var n = Int(readLine()!)!
var temp = readLine()!.components(separatedBy: " ")
var arr : [Int] = temp.map{ (value : String) -> Int in
    return Int(value)!
}
arr = arr.sorted(by: <)

n = Int(readLine()!)!
temp = readLine()!.components(separatedBy: " ")
let findNum : [Int] = temp.map{ (value : String) -> Int in
    return Int(value)!
}

func binarySearch(to num : Int, from arr : [Int]) -> Bool {
    var start = 0
    var end = arr.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if arr[mid] == num { return true }
        if arr[mid] > num { end = mid - 1 }
        else { start = mid + 1 }
    }
        
    return false
}

for num in findNum {
    if binarySearch(to: num, from: arr) { answer += "1\n"}
    else { answer += "0\n" }
}

print(answer)
