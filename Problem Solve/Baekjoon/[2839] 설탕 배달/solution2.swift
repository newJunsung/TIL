import Foundation

var input = Int(readLine()!)!
var dp: [Int] = Array(repeating: 0, count: input + 1)

dp[3] = 1

if input >= 5 {
    for i in 5...input {
        if (i % 5 == 0) {
            dp[i] = dp[i - 5] + 1
        } else if (i % 3 == 0) {
            dp[i] = dp[i - 3] + 1
        } else {
            if (dp[i - 3] != 0 && dp[i - 5] != 0) {
                dp[i] = min(dp[i - 3], dp[i - 5]) + 1
            }
        }
    }
}

dp[input] == 0 ? print(-1) : print(dp[input])
