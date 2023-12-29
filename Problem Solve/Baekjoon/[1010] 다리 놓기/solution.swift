var dp = [[Int]](repeating: [Int](repeating: 0, count: 31), count: 31)
for i in 0...30 {
    for j in 0...i {
        if i == j || j == 0 {
            dp[i][j] = 1
            continue
        }
        dp[i][j] = dp[i - 1][j - 1] + dp[i - 1][j]
    }
}

for _ in 0..<Int(readLine()!)! {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    print(dp[nm[1]][nm[0]])
}
