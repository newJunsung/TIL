let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var map = [[Int]]()
for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 0..<n {
    for j in 0..<m {
        var up = map[i][j]
        if (0..<n).contains(i - 1) {
            up += map[i - 1][j]
        }
        
        var left = map[i][j]
        if (0..<m).contains(j - 1) {
            left += map[i][j - 1]
        }
        map[i][j] = max(up, left)
    }
}
print(map[n - 1][m - 1])
