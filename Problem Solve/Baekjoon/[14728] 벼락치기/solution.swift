let nt = readLine()!.split(separator: " ").map { Int($0)! }
let (n, t) = (nt[0], nt[1])

var units = [(k: Int, s: Int)]()
for _ in 0..<n {
    let ks = readLine()!.split(separator: " ").map { Int($0)! }
    units.append((k: ks[0], s: ks[1]))
}

var dp = [Int](repeating: 0, count: t + 1)
for (k, s) in units {
    let num = t / k
    if num == 0 { continue }
    
    for i in (0...t).reversed() {
        if i - k < 0 { break }
        dp[i] = max(dp[i], dp[i - k] + s)
    }
}
print(dp.max()!)
