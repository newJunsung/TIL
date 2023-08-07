let ms = readLine()!.split(separator: ":").map { Int($0)! }
let s = ms[0] * 6 + ms[1] / 10
let button = [1, 6, 60]
var dp = [[Int]](repeating: [Int](repeating: Int.max, count: 2), count: 420)
dp[0][0] = 0
dp[0][1] = 0
for i in 1..<420 {
    for b in button {
        if i - b >= 0 {
            dp[i][0] = min(dp[i][0], dp[i - b][0] + 1)
        }
    }
    if i - 3 >= 0 {
        dp[i][1] = min(dp[i][1], dp[i - 3].min()! + 1)
    }
}
dp[s][0] += 1
print(dp[s].min()!)
