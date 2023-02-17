import Foundation

let input = Int(readLine()!)!

var seq = 0
var output: [[Int]] = Array(repeating: [0, 0], count: input + 1)

var arr: [Int] = Array(repeating: 0, count: input + 1)

for i in 1...input {
    arr[i] = Int(readLine()!)!
}
output[1] = [arr[1], arr[1]]

if input >= 2 {
    for i in 2...input {
        output[i][1] = output[i-1][0] + arr[i]
        output[i][0] = output[i - 2].max()! + arr[i]
    }
}

print(output.last!.max()!)
