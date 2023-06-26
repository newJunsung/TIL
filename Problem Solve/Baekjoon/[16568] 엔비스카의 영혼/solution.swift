let s = readLine()!.split(separator: " ").map{ Int($0)! }
let n = s[0], a = s[1], b = s[2]

if n != 0 {
    var dp = [Int](repeating: 1_000_001, count: n + 1)
    dp[0] = 0
    
    for i in 1...n {
        dp[i] = dp[i - 1] + 1
        if i - a - 1 >= 0 {
            dp[i] = min(dp[i], dp[i - a - 1] + 1)
        }
        if i - b - 1 >= 0 {
            dp[i] = min(dp[i], dp[i - b - 1] + 1)
        }
    }
    print(dp[n])
} else {
    print(0)
}
