// 동전
var result = ""
for _ in 0..<Int(readLine()!)! {
    let _ = Int(readLine()!)!
    let coins = readLine()!.split(separator: " ").map { Int($0)! }
    let m = Int(readLine()!)!
    
    var dp = [Int](repeating: 0, count: 10_000 + 1)
    dp[0] = 1
    
    for coin in coins {
        if coin > m { break }
        let leftCoins = m - coin
        for i in 0...leftCoins {
            dp[i + coin] += dp[i]
        }
    }
    
    result += "\(dp[m])\n"
}
print(result)
