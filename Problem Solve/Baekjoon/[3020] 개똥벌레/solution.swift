let nh = readLine()!.split(separator: " ").map { Int($0)! }
let (n, h) = (nh[0], nh[1])

var top = [Int](repeating: 0, count: h + 2)
var bottom = [Int](repeating: 0, count: h + 2)
for i in 0..<n {
    let hudle = Int(readLine()!)!
    if i.isMultiple(of: 2) {
        bottom[hudle] += 1
    } else {
        top[h - hudle + 1] += 1
    }
}

for i in 1...h {
    top[i] += top[i - 1]
    bottom[h - i] += bottom[h - i + 1]
}

var minimum = Int.max
var count = 1
for i in 1...h {
    let wall = top[i] + bottom[i]
    if minimum > wall {
        minimum = wall
        count = 1
    } else if minimum == wall {
        count += 1
    }
}
print("\(minimum) \(count)")
