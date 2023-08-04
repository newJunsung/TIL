let nm = readLine()!.split(separator: " ").map { Int($0)! }
let staff = readLine()!.split(separator: " ").map { Int($0)! }

var leading = 0
var trailing = 100_000_000_000
while leading < trailing {
    let mid = (leading + trailing) / 2
    var count = 0
    for s in staff {
        count += mid / s
    }
    if count < nm[1] {
        leading = mid + 1
    } else {
        trailing = mid
    }
}
print(leading)
