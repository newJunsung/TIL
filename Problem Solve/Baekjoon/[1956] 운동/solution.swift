import Foundation

let ve = readLine()!.split(separator: " ").map { Int($0)! }
let (v, e) = (ve[0], ve[1])

var map = [[Int]](repeating: [Int](repeating: Int.max, count: v), count: v)
for i in 0..<v {
    map[i][i] = 0
}

for _ in 0..<e {
    let road = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (a, b, c) = (road[0], road[1], road[2] + 1)
    map[a][b] = c
}

for i in 0..<v {
    for j in 0..<v {
        for k in 0..<v {
            var cmp = Int.max
            if map[j][i] != Int.max && map[i][k] != Int.max {
                cmp = map[j][i] + map[i][k]
            }
            map[j][k] = min(cmp, map[j][k])
        }
    }
}

var result = Int.max
for i in 0..<v {
    for j in 0..<v where !(i == j || map[j][i] == Int.max || map[i][j] == Int.max) {
        result = min(result, map[i][j] + map[j][i])
    }
}
print(result == Int.max ? -1 : result)
