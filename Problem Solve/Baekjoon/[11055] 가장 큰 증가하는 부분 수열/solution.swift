let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var dp = arr
for i in 0..<n {
    for j in 0...i {
        if arr[j] < arr[i] {
            dp[i] = max(dp[i], arr[i] + dp[j])
        }
    }
}
print(dp.max()!)
