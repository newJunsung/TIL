let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let lectures = readLine()!.split(separator: " ").map { Int($0)! }

var leading = lectures.max()!
var trailing = lectures.reduce(0, +)
var result = 0
while leading <= trailing {
    let mid = (leading + trailing) / 2
    var minutes = 0
    var count = 0
    for i in 0..<n {
        if minutes + lectures[i] > mid {
            count += 1
            minutes = 0
        }
        minutes += lectures[i]
    }
    if minutes != 0 {
        count += 1
    }
    
    if count > m {
        leading = mid + 1
    } else {
        trailing = mid - 1
        result = mid
    }
}
print(result)
