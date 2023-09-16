let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }

var mini = a[0]
var maxi = 0
var dp = [Int](repeating: 0, count: 200_000)
for i in 1..<n {
    mini = min(mini, a[i])
    dp[i] = max(a[i] - mini, dp[i - 1])
}
print(dp[0..<n].map { String($0) }.joined(separator: " "))
