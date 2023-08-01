let n = Int(readLine()!)!
var portions = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var p1 = portions.first!
var p2 = portions.last!
var diff = abs(p1 + p2)
for i in 0..<n {
    let portion = abs(portions[i])
    
    var leading = i + 1
    var trailing = n
    while leading < trailing {
        let mid = (leading + trailing) / 2
        if portion < portions[mid] {
            trailing = mid
        } else {
            leading = mid + 1
        }
        
        if abs(portions[i] + portions[mid]) < diff {
            diff = abs(portions[i] + portions[mid])
            p1 = portions[i]
            p2 = portions[mid]
        }
    }
}
print("\(p1) \(p2)")
