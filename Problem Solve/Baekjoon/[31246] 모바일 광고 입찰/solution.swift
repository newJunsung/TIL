let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

var left = 0
var right = -1
var ads = [(a: Int, b: Int)]()

for _ in 0..<n {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (ab[0], ab[1])
    ads.append((a: a, b: b))
    right = max(right, b)
}

while left <= right {
    let mid = (left + right) / 2
    
    var count = 0
    for (a, b) in ads where (a + mid) >= b {
        count += 1
    }
    
    if count < k {
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(left)

