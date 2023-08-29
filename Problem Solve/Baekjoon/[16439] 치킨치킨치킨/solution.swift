let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var arr = [[Int]](repeating: [], count: n)
for i in 0..<n {
    arr[i] = readLine()!.split(separator: " ").map { Int($0)! }
}

var result = 0
for i in 0..<(m - 2) {
    for j in 1..<(m - 1) {
        for k in 2..<m {
            var sum = 0
            for l in 0..<n {
                sum += max(arr[l][i], arr[l][j], arr[l][k])
            }
            result = max(result, sum)
        }
    }
}
print(result)
