let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

var mak = [Int]()
for _ in 0..<n {
    mak.append(Int(readLine()!)!)
}

var leading = 1
var trailing = 2 << 31 - 1
while leading < trailing {
    let mid = (leading + trailing) / 2
    if mak.reduce(0, { $0 + $1 / mid }) < k {
        trailing = mid
    } else {
        leading = mid + 1
    }
}
print(leading - 1)

