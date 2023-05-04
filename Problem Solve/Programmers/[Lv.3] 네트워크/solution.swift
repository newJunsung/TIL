import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var count = 0
    var isVisited = [Bool](repeating: false, count: n)
    
    for i in 0..<n {
        if !isVisited[i] {
            count += 1
            dfs(from: i, isVisited: &isVisited, computers: computers, n: n)
        }
    }
    
    return count
}

func dfs(from start: Int, isVisited: inout [Bool], computers:[[Int]], n: Int) {
    isVisited[start] = true
    
    for i in 0..<n {
        if computers[start][i] == 1 && !isVisited[i] {
            dfs(from: i, isVisited: &isVisited, computers: computers, n: n)
        }
    }
}
