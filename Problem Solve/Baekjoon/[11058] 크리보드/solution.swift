var dp = [Int](repeating: 0, count: 101)
dp[1] = 1
dp[2] = 2
dp[3] = 3

for i in 3..<101 {
    dp[i] = dp[i - 1] + 1
    
    for j in 3..<i {
        dp[i] = max(dp[i], dp[i - j] * (j - 1))
    }
}

print(dp[Int(readLine()!)!])
