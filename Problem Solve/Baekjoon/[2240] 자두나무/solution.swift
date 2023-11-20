let tw = readLine()!.split(separator: " ").map { Int($0)! }
let (t, w) = (tw[0], tw[1])

var dp = [[Int]](repeating: [Int](repeating: 0, count: w + 1), count: t + 1)
for i in 1...t {
    let treeNumber = Int(readLine()!)! == 1
    
    dp[i][0] = dp[i - 1][0]
    if treeNumber {
        dp[i][0] += 1
    }
    
    for j in 1...w {
        if i < j {
            break
        }
        
        let location = j.isMultiple(of: 2)
        
        if treeNumber == location {
            dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - 1]) + 1
        } else {
            dp[i][j] = max(dp[i - 1][j], dp[i - 1][j - 1])
        }
    }
}

print(dp[t].max()!)
