let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var relationships = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
for i in 0..<n {
    relationships[i][i] = 0
}

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (a, b) = (ab[0], ab[1])
    relationships[a][b] = 1
    relationships[b][a] = 1
}

for i in 0..<n {
    for j in 0..<n {
        for k in 0..<n {
            if relationships[j][i] != Int.max && relationships[i][k] != Int.max {
                relationships[j][k] = min(relationships[j][i] + relationships[i][k], relationships[j][k])
            }
        }
    }
}

var result = -1
var count = Int.max
for i in 0..<n {
    let temp = relationships[i].reduce(0, +)
    if count > temp {
        count = temp
        result = i
    }
}
print(result + 1)
