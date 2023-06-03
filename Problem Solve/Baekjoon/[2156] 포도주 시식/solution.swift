let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n + 1)
var arr = [Int](repeating: 0, count: n + 1)
for i in 1...n {
    arr[i] = Int(readLine()!)!
}
dp[1] = arr[1]

if n > 1 {
    dp[2] = arr[1] + arr[2]
}

if n > 2 {
    for i in 3...n {
        dp[i] = max(dp[i-2] + arr[i], dp[i-3] + arr[i] + arr[i-1], dp[i-1])
    }
}
print(dp[n])
