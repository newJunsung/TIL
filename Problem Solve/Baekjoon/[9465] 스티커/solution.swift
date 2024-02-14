var result = ""
for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    
    var stickers = [[Int]]()
    stickers.append(readLine()!.split(separator: " ").map { Int($0)! })
    stickers.append(readLine()!.split(separator: " ").map { Int($0)! })
    
    var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n + 2)
    for i in 0..<n {
        dp[i + 2][0] = max(dp[i + 1][1], dp[i].max()!) + stickers[0][i]
        dp[i + 2][1] = max(dp[i + 1][0], dp[i].max()!) + stickers[1][i]
    }
    
    result += "\(dp.last!.max()!)\n"
}
print(result)
