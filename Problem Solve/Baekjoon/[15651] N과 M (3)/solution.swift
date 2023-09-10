let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var str = ""
var arr = [Int]()
func dfs(depth: Int) {
    if depth == m {
        str += "\(arr.map { String($0) }.joined(separator: " "))\n"
    } else {
        for i in 1...n {
            arr.append(i)
            dfs(depth: depth + 1)
            arr.removeLast()
        }
    }
}
dfs(depth: 0)
print(str)
