let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var isVisited = [Bool](repeating: false, count: n + 1)
var arr = [Int]()
func dfs(from start: Int, depth: Int) {
    if depth == m {
        print(arr.map { String($0) }.joined(separator: " "))
    } else {
        if start <= n {
            for i in start...n where !isVisited[i] {
                isVisited[i] = true
                arr.append(i)
                dfs(from: i + 1, depth: depth + 1)
                isVisited[i] = false
                arr.removeLast()
            }
        }
    }
}
dfs(from: 1, depth: 0)
