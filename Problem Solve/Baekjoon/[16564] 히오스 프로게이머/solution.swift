let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

var left = 1
var right = -1
var levels = [Int]()
for _ in 0..<n {
    let level = Int(readLine()!)!
    levels.append(level)
    right = max(right, level)
}
right += k

while left <= right {
    let mid = (left + right) / 2
    
    var count = 0
    for level in levels {
        let num = mid - level
        count += (num < 0 ? 0 : num)
    }
    
    if count <= k {
        left = mid + 1
    } else {
        right = mid - 1
    }
}
print(right)
