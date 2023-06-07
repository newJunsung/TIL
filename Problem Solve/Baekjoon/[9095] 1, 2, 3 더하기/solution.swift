var dp = [Int](repeating: 0, count: 12)
dp[1] = 1
dp[2] = 2
dp[3] = 4
dp[4] = 7
dp[5] = 13
dp[6] = 24
for i in 7...11 {
    dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]
}

let k = Int(readLine()!)!
for _ in 0..<k {
    let n = Int(readLine()!)!
    print(dp[n])
}
