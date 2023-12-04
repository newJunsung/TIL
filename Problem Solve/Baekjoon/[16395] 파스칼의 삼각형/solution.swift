let nk = readLine()!.split(separator: " ").map { Int($0)! - 1 }
let (n, k) = (nk[0], nk[1])

var pascal = [[Int]]()
for i in 0..<30 {
    pascal.append([Int](repeating: 1, count: i + 1))
    for j in 0...i {
        let left = (i - 1) >= 0 && (j - 1) >= 0 ? pascal[i - 1][j - 1] : 0
        let right = (i - 1) >= 0 && j < i ? pascal[i - 1][j] : 0
        pascal[i][j] = left + right == 0 ? 1 : left + right
    }
}
print(pascal[n][k])
