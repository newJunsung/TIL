let n = Int(readLine()!)!
let states = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!

var left = 1
var right = states.max()!
while left <= right {
    let mid = (left + right) / 2
    
    var budget = 0
    for state in states {
        if state <= mid {
            budget += state
        } else {
            budget += mid
        }
    }
    
    if budget > m {
        right = mid - 1
    } else {
        left = mid + 1
    }
}
print(right)
