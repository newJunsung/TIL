var tc = 1
while true {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (nm[0], nm[1])
    if n == 0 && m == 0 {
        break
    }
    
    var vertexes = [[Int]](repeating: [], count: n)
    for _ in 0..<m {
        let edge = readLine()!.split(separator: " ").map { Int($0)! - 1 }
        vertexes[edge[0]].append(edge[1])
        vertexes[edge[1]].append(edge[0])
    }
    
    var count = 0
    var isTree = true
    var isVisited = [Bool](repeating: false, count: n)
    for i in 0..<n where !isVisited[i] {
        isTree = true
        isVisited[i] = true
        dfs(i)
        if isTree {
            count += 1
        }
    }
    
    func dfs(_ index: Int) {
        var count = 0
        for vertex in vertexes[index] {
            if !isVisited[vertex] {
                isVisited[vertex] = true
                dfs(vertex)
            } else {
                count += 1
            }
        }
        if count > 1 {
            isTree = false
        }
    }
    
    switch count {
    case 0:
        print("Case \(tc): No trees.")
    case 1:
        print("Case \(tc): There is one tree.")
    default:
        print("Case \(tc): A forest of \(count) trees.")
    }
    tc += 1
}
