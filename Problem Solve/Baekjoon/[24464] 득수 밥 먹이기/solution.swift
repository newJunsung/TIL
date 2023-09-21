let n = Int(readLine()!)!
var dp = [[Int]](repeating: [Int](repeating: 1, count: 5), count: 200_001)
for i in 2...200_000 {
    let p = dp[i - 1]
    dp[i][0] = (p[1] + p[2] + p[3] + p[4]) % 1_000_000_007
    dp[i][1] = (p[0] + p[3] + p[4]) % 1_000_000_007
    dp[i][2] = (p[0] + p[4]) % 1_000_000_007
    dp[i][3] = (p[0] + p[1]) % 1_000_000_007
    dp[i][4] = (p[0] + p[1] + p[2]) % 1_000_000_007
}
print(dp[n].reduce(0, +) % 1_000_000_007)
