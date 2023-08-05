let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

var coins = [Int]()
for _ in 0..<n {
    coins.append(Int(readLine()!)!)
}

var dp = [Int](repeating: 1<<30, count: k + 1)
dp[0] = 0
for i in 0...k {
    for c in coins {
        if (0...k).contains(i - c) {
            dp[i] = min(dp[i], dp[i - c] + 1)
        }
    }
}
print(dp[k] >= 1<<30 ? -1 : dp[k])
