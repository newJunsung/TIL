let nq = readLine()!.split(separator: " ").map { Int($0)! }
var arr =  [0] + readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
for i in 0..<nq[0] {
    arr[i + 1] += arr[i]
}

var ans = ""
for _ in 0..<nq[1] {
    let lr = readLine()!.split(separator: " ").map { Int($0)! }
    ans += "\(arr[lr[1]] - arr[lr[0] - 1])\n"
}
print(ans)
