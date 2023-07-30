let nc = readLine()!.split(separator: " ").map { Int($0)! }

var arr = [Int]()
for _ in 0..<nc[0] {
    arr.append(Int(readLine()!)!)
}
arr.sort()

var leading = 1
var trailing = arr.last! - arr.first! + 1
while leading < trailing {
    let mid = (leading + trailing) / 2
    
    var count = 1
    var prev = 0
    for i in 1..<nc[0] {
        if mid <= arr[i] - arr[prev] {
            prev = i
            count += 1
        }
    }
    
    if count < nc[1] {
        trailing = mid
    } else {
        leading = mid + 1
    }
}
print(leading - 1)
