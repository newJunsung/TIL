let nrq = readLine()!.split(separator: " ").map { Int($0)! }
let (n, r, q) = (nrq[0], nrq[1] - 1, nrq[2])

var tree = [[Int]](repeating: [], count: n)
for _ in 0..<(n - 1) {
    let ab = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    tree[ab[0]].append(ab[1])
    tree[ab[1]].append(ab[0])
}

var isVisited = [Bool](repeating: false, count: n)
var size = [Int](repeating: 1, count: n)
func dfs(from node: Int) {
    for t in tree[node] where !isVisited[t] {
        isVisited[t] = true
        dfs(from: t)
        size[node] += size[t]
    }
}
isVisited[r] = true
dfs(from: r)
var result = ""
for _ in 0..<q {
    result += "\(size[Int(readLine()!)! - 1])\n"
}
print(result)
