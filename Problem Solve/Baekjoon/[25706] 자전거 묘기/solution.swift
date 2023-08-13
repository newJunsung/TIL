let n = Int(readLine()!)!
let jump = [0] + readLine()!.split(separator: " ").map { Int($0)! }

var dp = [Int](repeating: 0, count: 400_005)
for i in (1...n).reversed() {
    dp[i] = dp[i + jump[i] + 1] + 1
}
print(dp[1...n].map { String($0) }.joined(separator: " "))
