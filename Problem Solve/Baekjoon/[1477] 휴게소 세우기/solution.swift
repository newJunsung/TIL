let nml = readLine()!.split(separator: " ").map { Int($0)! }
let rests = [0] + readLine()!.split(separator: " ").map { Int($0)! }.sorted() + [nml[2]]

func getRestCount(_ mid: Int, rests: [Int]) -> Int {
    var sum = 0
    for i in (1..<rests.count) {
        sum += (rests[i] - rests[i - 1] - 1) / mid
    }
    return sum
}

var leading = 1
var trailing = nml[2] - 1
while leading <= trailing {
    let mid = (trailing + leading) / 2
    if getRestCount(mid, rests: rests) <= nml[1] {
        trailing = mid - 1
    } else {
        leading = mid + 1
    }
}
print(leading)
