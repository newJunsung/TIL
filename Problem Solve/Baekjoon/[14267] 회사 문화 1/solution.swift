let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let info = readLine()!.split(separator: " ").map { Int($0)! - 1 }

var employee = [[Int]](repeating: [], count: n)
for i in 0..<n where info[i] >= 0 {
    employee[info[i]].append(i)
}

var amount = [Int](repeating: 0, count: n)
for _ in 0..<m {
    let iw = readLine()!.split(separator: " ").map { Int($0)! }
    amount[iw[0] - 1] += iw[1]
}
func dfs(from vertex: Int) {
    for v in employee[vertex] {
        amount[v] += amount[vertex]
        dfs(from: v)
    }
}
dfs(from: 0)
print(amount.map { String($0) }.joined(separator: " "))
