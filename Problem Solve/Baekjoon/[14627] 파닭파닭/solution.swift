let sc = readLine()!.split(separator: " ").map { Int($0)! }
var length = 0
var pas = [Int]()
for _ in 0..<sc[0] {
    let pa = Int(readLine()!)!
    pas.append(pa)
    length += pa
}

var leading = 1
var trailing = 1_000_000_000
while leading <= trailing {
    let mid = (leading + trailing) / 2
    var count = 0
    pas.forEach { pa in
        count += pa / mid
    }
    if count < sc[1] {
        trailing = mid - 1
    } else {
        leading = mid + 1
    }
}
print(length - trailing * sc[1])

