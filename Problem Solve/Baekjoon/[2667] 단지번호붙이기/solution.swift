import Foundation

func dfs(n: Int, m: Int, graph: inout [[String]], count: Int) {
    if graph[n][m] == "0" {
        return
    }
    graph[n][m] = "0"
    answer[total - 1] += 1
    
    let dx = [0, 0, -1, 1]
    let dy = [-1, 1, 0, 0]
    
    for i in 0..<4 {
        let tempN = n + dy[i]
        let tempM = m + dx[i]
        
        if tempN < 0 || tempN >= graph.count { continue }
        if tempM < 0 || tempM >= graph[tempN].count { continue }
        
        dfs(n: tempN, m: tempM, graph: &graph, count: count + 1)
    }
}

let size = Int(readLine()!)!

var house = [[String]](repeating: [], count: size)
var answer = [Int]()

for i in 0..<size {
    let str = readLine()!.map({ c in
        return String(c)
    })
    house[i] = str
}

var total = 0
for n in 0..<size {
    for m in 0..<size {
        if house[n][m] == "1" {
            total += 1
            answer.append(0)
            dfs(n: n, m: m, graph: &house, count: 0)
        }
    }
}

print(total)
answer.sort()
for i in answer {
    print(i)
}
