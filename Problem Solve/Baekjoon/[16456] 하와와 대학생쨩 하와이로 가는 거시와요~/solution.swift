let n = Int(readLine()!)!
var arr = [Int](repeating: 1, count: n + 1)
if n >= 3 {
    for i in 3...n {
        arr[i] = (arr[i - 1] + arr[i - 3]) % 1_000_000_009
    }
}
print(arr[n])
