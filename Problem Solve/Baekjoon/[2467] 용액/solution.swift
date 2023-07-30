let n = Int(readLine()!)!
let portions = readLine()!.split(separator: " ").map { Int($0)! }

var p1 = 0
var p2 = n - 1
var diff = abs(portions.first! + portions.last!)
for i in 0..<n {
    var leading = i + 1
    var trailing = n
    while leading < trailing {
        let mid = (leading + trailing) / 2
        if abs(portions[i]) < portions[mid] {
            trailing = mid
        } else {
            leading = mid + 1
        }
        
        if abs(portions[i] + portions[mid]) < abs(diff) {
            diff = portions[i] + portions[mid]
            p1 = i
            p2 = mid
        }
    }
}
print("\(portions[p1]) \(portions[p2])")
