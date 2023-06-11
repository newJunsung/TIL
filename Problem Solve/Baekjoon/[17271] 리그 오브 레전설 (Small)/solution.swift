let nb = readLine()!.split(separator: " ").map { Int($0)! }
let n = nb[0], b = nb[1]

var dp = [Int](repeating: 1, count: n + 1)
if n >= b {
    for i in b...n {
        dp[i] = (dp[i - 1] + dp[i - b]) % 1_000_000_007
    }
}
print(dp[n])
