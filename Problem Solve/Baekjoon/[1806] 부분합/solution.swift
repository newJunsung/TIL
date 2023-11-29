let ns = readLine()!.split(separator: " ").map { Int($0)! }
let (n, s) = (ns[0], ns[1])
let numbers = readLine()!.split(separator: " ").map { Int($0)! }

var prefixSum = [0]
for i in 0..<n {
    prefixSum.append(prefixSum[i] + numbers[i])
}

var left = 0
var right = 0
var result = Int.max
while right <= n {
    let sum = prefixSum[right] - prefixSum[left]
    if sum < s {
        right += 1
    } else {
        result = min(result, right - left)
        left += 1
    }
}
print(result == Int.max ? 0 : result)
