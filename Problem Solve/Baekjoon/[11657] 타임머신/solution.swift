let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var routes = [(start: Int, end: Int, time: Int)]()
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (a, b, c) = (abc[0], abc[1], abc[2] + 1)
    
    routes.append((start: a, end: b, time: c))
}

var isInfinity = false
var result = ""

var spendTimes = [Int](repeating: Int.max, count: n)
spendTimes[0] = 0

for i in 0..<n {
    for route in routes {
        if spendTimes[route.start] != Int.max && spendTimes[route.start] + route.time < spendTimes[route.end] {
            spendTimes[route.end] = spendTimes[route.start] + route.time
            
            if i == (n - 1) {
                isInfinity = true
            }
        }
    }
}

if isInfinity {
    result = "-1"
} else {
    spendTimes[1..<n].forEach { result += "\($0 == Int.max ? -1 : $0)\n" }
}
print(result)
