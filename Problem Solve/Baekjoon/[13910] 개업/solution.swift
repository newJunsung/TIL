let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var woks = readLine()!.split(separator: " ").map { Int($0)! }
for i in 0..<(m - 1) {
    for j in (i + 1)..<m where woks[i] + woks[j] <= 10_000 {
        woks.append(woks[i] + woks[j])
    }
}

var dp = [Int](repeating: Int.max, count: 10_001)
for wok in woks {
    dp[wok] = 1
}
for i in 1...n where dp[i] == Int.max {
    for j in 1..<i where dp[j] != Int.max && dp[i - j] != Int.max {
        dp[i] = min(dp[i], dp[i - j] + dp[j])
    }
}
print(dp[n] == Int.max ? -1 : dp[n])
