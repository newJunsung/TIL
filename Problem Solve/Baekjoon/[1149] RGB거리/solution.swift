import Foundation

let input = Int(readLine()!)!

var colors: [[Int]] = Array(repeating: [], count: input + 1)
colors[0] = [0, 0, 0]

for i in 1...input {
    let costs = readLine()!.split(separator: " ").map { Int($0)! }
    
    let a = min(costs[0] + colors[i - 1][1], costs[0] + colors[i - 1][2])
    let b = min(costs[1] + colors[i - 1][0], costs[1] + colors[i - 1][2])
    let c = min(costs[2] + colors[i - 1][0], costs[2] + colors[i - 1][1])
    
    colors[i] = [a, b, c]
}

print(colors[input].min()!)
