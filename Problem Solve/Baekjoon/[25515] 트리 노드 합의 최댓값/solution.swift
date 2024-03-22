let n = Int(readLine()!)!

var tree = [[Int]](repeating: [], count: n)
for _ in 0..<n - 1 {
    let pc = readLine()!.split(separator: " ").map { Int($0)! }
    tree[pc[0]].append(pc[1])
}

var dp = readLine()!.split(separator: " ").map { Int($0)! }
var isVisted = [Bool](repeating: false, count: n)
isVisted[0] = true

func dfs(_ index: Int) {
    for node in tree[index] {
        if !isVisted[node] {
            isVisted[node] = true
            dfs(node)
            dp[index] = max(dp[index], dp[node] + dp[index])
        }
    }
}
dfs(0)

print(dp[0])
