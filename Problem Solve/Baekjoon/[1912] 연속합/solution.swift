let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }

if n == 1 {
    print(arr[0])
} else {
    var dp = [Int](repeating: 0, count: n)
    dp[0] = arr[0]
    
    for i in 1..<arr.count {
        dp[i] = max(dp[i - 1] + arr[i], arr[i])
    }
    print(dp.max()!)
}
