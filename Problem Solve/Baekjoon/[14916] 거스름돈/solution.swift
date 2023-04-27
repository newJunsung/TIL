var dp = [Int](repeating: 100_001, count: 100_001)
dp[2] = 1
dp[4] = 2
dp[5] = 1

for i in 6..<100_001 {
    var m2 = 100_001
    var m5 = 100_001

    if (dp[i - 2]) != -1 {
        m2 = dp[i - 2] + 1
    }
    if (dp[i - 5]) != -1 {
        m5 = dp[i - 5] + 1
    }

    dp[i] = min(m2, m5)
}

let temp = dp[Int(readLine()!)!]
let answer = temp >= 100_001 ? -1 : temp
print(answer)
