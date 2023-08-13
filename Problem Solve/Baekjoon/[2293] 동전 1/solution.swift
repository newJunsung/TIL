import Foundation
let nk = readLine()!.split(separator: " ").map{Int($0)!}
let (n, k) = (nk[0], nk[1])

var coin = [Int]()
for _ in 0..<n{
    coin.append(Int(readLine()!)!)
}

var dp = [Int](repeating: 0, count: k + 1)
dp[0] = 1
for i in 0..<n{
    for j in stride(from: coin[i], through: k, by: 1){
        if dp[j] + dp[j - coin[i]] >= 1<<31 {
            dp[j] = 0
        }else{
            dp[j] += dp[j - coin[i]]
        }
    }
}
print(dp[k])
