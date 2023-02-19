import Foundation

let str = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (str[0], str[1])

var count = 0
var s = Set<String>()

for _ in 0..<n {
    s.insert(readLine()!)
}

for _ in 0..<m {
    if s.contains(readLine()!) {
        count += 1
    }
}

print(count)
