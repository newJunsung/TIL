var n = Int(readLine()!)!
var dp = [Int](repeating: Int.max, count: n + 1)
dp[0] = 0

if n > 0 {
    dp[1] = 1
}
if n > 1 {
    dp[1] = 1
}
if n > 4 {
    dp[1] = 1
}
if n > 6 {
    dp[1] = 1
}

for i in 0...n {
    if i + 1 <= n {
        dp[i + 1] = min(dp[i + 1], dp[i] + 1)
    }
    if i + 2 <= n {
        dp[i + 2] = min(dp[i + 2], dp[i] + 1)
    }
    if i + 5 <= n {
        dp[i + 5] = min(dp[i + 5], dp[i] + 1)
    }
    if i + 7 <= n {
        dp[i + 7] = min(dp[i + 7], dp[i] + 1)
    }
}
print(dp[n])
