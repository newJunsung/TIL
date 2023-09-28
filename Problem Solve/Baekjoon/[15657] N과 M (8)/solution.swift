let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var result = ""
var isVisited = [Bool](repeating: false, count: n)
var combination = [Int]()
func dfs(_ index: Int, depth: Int) {
    if depth == m {
        result += "\(combination.map { String($0) }.joined(separator: " "))\n"
    } else {
        for i in index..<n {
            isVisited[i] = true
            combination.append(arr[i])
            dfs(i, depth: depth + 1)
            combination.removeLast()
            isVisited[i] = false
        }
    }
}
dfs(0, depth: 0)
print(result)
