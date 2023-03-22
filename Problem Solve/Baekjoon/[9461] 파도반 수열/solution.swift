import Foundation

let tc = Int(readLine()!)!

var arr = [Int](repeating: 0, count: 101)
arr[1] = 1
arr[2] = 1
arr[3] = 1
arr[4] = 2

for i in 5..<101 {
    arr[i] = arr[i - 1] + arr[i - 5]
}

for _ in 0..<tc {
    let n = Int(readLine()!)!
    print(arr[n])
}
