let mn = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n) = (mn[0], mn[1])
let snacks = readLine()!.split(separator: " ").map { Int($0)! }

var length = 0
var left = 1
var right = 1_000_000_000
while left <= right {
    let mid = (left + right) / 2
    
    var count = 0
    for snack in snacks {
        count += (snack / mid)
    }
    
    if count < m {
        right = mid - 1
    } else {
        left = mid + 1
    }
}
print(right)
