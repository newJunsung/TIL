let n = Int(readLine()!)!
let stocks = readLine()!.split(separator: " ").map { Int($0)! }

var low = stocks[0]
var dp = [Int](repeating: 0, count: 200_001)
for i in 0..<n {
    low = min(low, stocks[i])
    dp[i + 1] = max(dp[i], stocks[i] - low)
}
print(dp[n])
