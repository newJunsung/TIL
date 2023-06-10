let n = Int(readLine()!)!
var dp = [Int](repeating: 1, count: n + 1)

if n >= 2 {
    for i in 2...n {
        dp[i] = (dp[i - 1] + dp[i - 2] + 1) % 1_000_000_007
    }
}

print(dp[n])
