let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var array = [[Int]]()
for _ in 0..<n {
    array.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var dp = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: n + 1)
for i in 1...n {
    for j in 1...n {
        dp[i][j] = dp[i - 1][j] + dp[i][j - 1] - dp[i - 1][j - 1] + array[i - 1][j - 1]
    }
}

var result = ""
for _ in 0..<m {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    let (x1, y1, x2, y2) = (info[0], info[1], info[2], info[3])
    result += "\(dp[x2][y2] + dp[x1 - 1][y1 - 1] - dp[x2][y1 - 1] - dp[x1 - 1][y2])\n"
}
print(result)
