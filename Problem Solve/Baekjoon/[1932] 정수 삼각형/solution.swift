import Foundation

let input = Int(readLine()!)!
var output: [[Int]] = []
var arr: [[Int]] = []

for i in 0..<input {
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append(numbers)
    output.append(Array(repeating: 0, count: i + 1))
    
    for j in 0..<output.count {
        if i == 0 {
            output[0][0] = arr[0][0]
            break;
        }

        if j == 0 {
            output[i][j] = arr[i][j] + output[i - 1][j]
        } else if j == output.count - 1 {
            output[i][j] = arr[i][j] + output[i - 1][j - 1]
        } else {
            output[i][j] = arr[i][j] + max(output[i - 1][j - 1], output[i - 1][j])
        }
    }
}

print(output[input - 1].max()!)
