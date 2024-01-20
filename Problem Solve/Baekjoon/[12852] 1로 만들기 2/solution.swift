let n = Int(readLine()!)!

var dp = [(count: Int, sequence: String)](repeating: (count: Int.max, sequence: ""), count: n + 1)
dp[1] = (0, "1")
for i in 1...n {
    let t = i * 3, s = i * 2, f = i + 1
    
    if t <= n {
        if dp[t].count > dp[i].count + 1 {
            dp[t] = (dp[i].count + 1, "\(t) " + dp[i].sequence)
        }
    }
    
    if s <= n {
        if dp[s].count > dp[i].count + 1 {
            dp[s] = (dp[i].count + 1, "\(s) " + dp[i].sequence)
        }
    }
    
    if f <= n {
        if dp[f].count > dp[i].count + 1 {
            dp[f] = (dp[i].count + 1, "\(f) " + dp[i].sequence)
        }
    }
}
print(dp[n].count)
print(dp[n].sequence)

