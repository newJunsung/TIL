let n = Int(readLine()!)!
let k = Int(readLine()!)!

var left = 1
var right = k

while left <= right {
    let mid = (left + right) / 2
    
    var count = 0
    for i in 1...n {
        count += min(n, mid / i)
    }
    
    if count < k {
        left = mid + 1
    } else {
        right = mid - 1
    }
}
print(left)
