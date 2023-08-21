let n = Int(readLine()!)!

var lines = [(a: Int, b: Int)]()
for _ in 0..<n {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    lines.append((a: ab[0], b: ab[1]))
}
lines.sort { $0.a < $1.a }

var dp = [Int](repeating: 1, count: n)
for i in 0..<n {
    for j in 0..<i {
        if lines[i].b > lines[j].b {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}
print(n - dp.max()!)
