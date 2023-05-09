let a = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var dp = [Int](repeating: 1, count: a)
for i in (0..<a).reversed() {
    for j in i..<a {
        if arr[i] > arr[j] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}
print(dp.max()!)
