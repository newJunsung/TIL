let rcw = readLine()!.split(separator: " ").map { Int($0)! }
let r = rcw[0] - 1, c = rcw[1] - 1, w = rcw[2]

var dp = [[Int]](repeating: [], count: 31)
dp[0] = [1]
dp[1] = [1, 1]
for i in 2...30 {
    var arr = [1]
    for j in 1...(i - 1) {
        let num = dp[i - 1][j - 1] + dp[i - 1][j]
        arr.append(num)
    }
    arr.append(1)
    dp[i] = arr
}

var sum = dp[r][c]
for i in 1..<w {
    sum += dp[r + i][c...(c + i)].reduce(0, +)
}
print(sum)
