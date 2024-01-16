let n = Int(readLine()!)!
let distances = readLine()!.split(separator: " ").map { Int($0)! }
let costs = readLine()!.split(separator: " ").map { Int($0)! }

var lower = Int.max
var result: Int = 0
for i in 0..<(n - 1) {
    if costs[i] < lower {
        lower = costs[i]
    }
    result += (lower * distances[i])
}
print(result)
