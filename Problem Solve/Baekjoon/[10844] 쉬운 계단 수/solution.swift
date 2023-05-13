let n = Int(readLine()!)!
var numbers = [Int](repeating: 0, count: 10)
var dp = [[Int]](repeating: numbers, count: n + 1)
dp[1] = [0,1,1,1,1,1,1,1,1,1]
for i in 1...n {
    if i == 1 { continue }
    for j in 0...9 {
        switch j {
        case 0:
            dp[i][j] = dp[i - 1][j + 1] % 1_000_000_000
        case 9:
            dp[i][j] = dp[i - 1][j - 1] % 1_000_000_000
        default:
            dp[i][j] = dp[i - 1][j - 1] + dp[i - 1][j + 1] % 1_000_000_000
        }
    }
}
print(dp[n].reduce(0, +) % 1_000_000_000)
