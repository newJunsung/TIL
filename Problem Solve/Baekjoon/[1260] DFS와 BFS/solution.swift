import Foundation

let nmv = readLine()!.split(separator: " ").map { Int($0)! }
// nmv[1] = n, nmv[1] = m, nmv[2] = v

var visited = [Bool](repeating: false, count: nmv[0] + 1)
var graph = [[Int]](repeating: [], count: nmv[0] + 1)
var ans = ""

for _ in 0..<nmv[1] {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    // nm[0] = n, nm[1] = m

    graph[nm[0]].append(nm[1])
    graph[nm[1]].append(nm[0])
}

for i in 1...nmv[0] {
    graph[i] = graph[i].sorted { $0 < $1 }
}

func dfs(from start: Int) {
    visited[start] = true
    ans += "\(start) "
    
    for n in graph[start] {
        if !visited[n] {
            dfs(from: n)
        }
    }
}

func bfs(from start: Int) {
    var queue = [start]
    visited[start] = true
    
    while !queue.isEmpty {
        let cur = queue.removeFirst()
        ans += "\(cur) "
        
        for i in graph[cur] {
            if !visited[i] {
                queue.append(i)
                visited[i] = true
            }
        }
    }
}

dfs(from: nmv[2])
print(ans)

ans = ""
visited = [Bool](repeating: false, count: nmv[0] + 1)
bfs(from: nmv[2])
print(ans)
