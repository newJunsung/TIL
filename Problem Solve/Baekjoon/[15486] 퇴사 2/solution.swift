let n = Int(readLine()!)!
var dp = [Int](repeating: 0, count: n + 2)
for i in (1...n) {
    let tp = readLine()!.split(separator: " ").map { Int($0)! }
    dp[i] = max(dp[i - 1], dp[i])
    
    let newDP = i + (tp[0])
    if (1...n + 1).contains(newDP) {
        if (1...n + 1).contains(newDP - 1) {
            dp[newDP] = max(dp[newDP], dp[newDP - 1])
        }
        
        dp[newDP] = max(dp[newDP], dp[i] + tp[1])
    }
}
print(dp.max()!)
