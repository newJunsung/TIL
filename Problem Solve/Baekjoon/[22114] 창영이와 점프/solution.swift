let nk = readLine()!.split(separator: " ").map { Int($0)! }
let l = readLine()!.split(separator: " ").map { Int($0)! }

var dp = [[Int]](repeating: [Int](repeating: 1, count: nk[0]), count: 2)
for i in 1..<nk[0] {
    if l[i - 1] <= nk[1] {
        dp[0][i] = dp[0][i - 1] + 1
        dp[1][i] = dp[1][i - 1] + 1
    } else {
        dp[0][i] = 1
        dp[1][i] = max(dp[0][i], dp[0][i - 1] + 1)
    }
}
print(dp[1].max()!)
