let nmr = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, r) = (nmr[0], nmr[1], nmr[2] - 1)

var graph = [[Int]](repeating: [], count: n)
for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (u, v) = (uv[0], uv[1])
    
    graph[u].append(v)
    graph[v].append(u)
}
for i in 0..<n {
    graph[i].sort()
}

var depths = [Int](repeating: -1, count: n)
func dfs(from index: Int) {
    for i in graph[index] where depths[i] == -1 {
        depths[i] = depths[index] + 1
        dfs(from: i)
    }
}
depths[r] = 0
dfs(from: r)

var result = ""
depths.forEach { result += "\($0)\n" }
print(result)
