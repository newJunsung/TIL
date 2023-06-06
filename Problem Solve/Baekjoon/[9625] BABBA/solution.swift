let k = Int(readLine()!)!

var dp = [(a: Int, b: Int)](repeating: (a: 0, b: 0), count: 46)
dp[0] = (a: 1, b: 0)

for i in 1...45 {
    let pA = dp[i - 1].a
    let pB = dp[i - 1].b
    
    dp[i].a = pB
    dp[i].b = pA + pB
}
print("\(dp[k].a) \(dp[k].b)")
