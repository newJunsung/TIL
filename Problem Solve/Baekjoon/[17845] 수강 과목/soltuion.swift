let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

var dp = [Int](repeating: 0, count: n + 1)
for _ in 0..<k {
    let it = readLine()!.split(separator: " ").map { Int($0)! }
    let (importance, time) = (it[0], it[1])
    
    if time > n { continue }
    
    for i in (time...n).reversed() {
        dp[i] = max(dp[i], dp[i - time] + importance)
    }
}
print(dp.max()!)
