let cn = readLine()!.split(separator: " ").map { Int($0)! }
let (c, n) = (cn[0], cn[1])

var infos = [(cost: Int, count: Int)]()
for _ in 0..<n {
    let cc = readLine()!.split(separator: " ").map { Int($0)! }
    infos.append((cc[0], cc[1]))
}

var dp = [Int](repeating: Int.max, count: c + 101)
dp[0] = 0
for (cost, count) in infos {
    if dp[count] < cost { continue }
    for i in (count..<c + 101) {
        let cmp = dp[i - count] == Int.max ? Int.max : dp[i - count] + cost
        dp[i] = min(dp[i], cmp)
    }
}
print(dp[c..<c + 101].min()!)

