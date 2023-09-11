let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var set = Set<String>()
var result = [Int]()
func dfs(_ start: Int) {
    if result.count == m {
        set.insert(result.map { String($0) }.joined(separator: " "))
    } else {
        result.append(start)
        for i in start...n {
            dfs(i)
        }
        result.removeLast()
    }
}
for i in 1...n {
    dfs(i)
}
print(set.sorted().joined(separator: "\n"))
