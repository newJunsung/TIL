let n = Int(readLine()!)!

var isVisited = [Bool](repeating: false, count: n)
var parentNode = [Int](repeating: 0, count: n)
var graph = [[Int]](repeating: [], count: n)

let root = 0
for _ in 0..<(n - 1) {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[info[0] - 1].append(info[1] - 1)
    graph[info[1] - 1].append(info[0] - 1)
}
isVisited[root] = true

dfs(graph: &graph, isVisited: &isVisited, parentNode: &parentNode, start: root)

var answer = ""
parentNode[1..<parentNode.count].forEach { i in
    answer += "\(i)\n"
}
print(answer)

func dfs(graph: inout [[Int]], isVisited: inout [Bool], parentNode: inout [Int], start: Int) {
    for g in graph[start] {
        if !isVisited[g] {
            isVisited[g] = true
            parentNode[g] = start + 1
            dfs(graph: &graph, isVisited: &isVisited, parentNode: &parentNode, start: g)
        }
    }
}
