import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var set = Set<String>()
var count = 0
var answer = [String]()

for _ in 0..<n {
    let name = readLine()!
    set.insert(name)
}

for _ in 0..<m {
    let name = readLine()!
    if set.contains(name) {
        count += 1
        answer.append(name)
    }
}

print(count)

answer.sort()
answer.forEach { name in
    print(name)
}
