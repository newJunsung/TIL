import Foundation

func solution(_ maps:[String]) -> [Int] {
    var answer = [Int]()
    var graph = [[String]]()
    for m in maps {
        graph.append(m.map { String($0) })
    }
    
    for i in 0..<graph.count {
        for j in 0..<graph[0].count {
            if graph[i][j] != "X" {
                var count = Int(graph[i][j])!
                graph[i][j] = "X"
                func dfs(_ y: Int, _ x: Int) {
                    let my = [-1, 1, 0, 0]
                    let mx = [0, 0, -1, 1]
                    
                    for i in 0..<4 {
                        let ty = y + my[i]
                        let tx = x + mx[i]
                        
                        if (0..<graph.count).contains(ty) && (0..<graph[0].count).contains(tx) {
                            if graph[ty][tx] != "X" {
                                count += Int(graph[ty][tx])!
                                graph[ty][tx] = "X"
                                dfs(ty, tx)
                            }
                        }
                    }
                }
                
                dfs(i, j)
                answer.append(count)
            }
        }
    }
    
    return answer.isEmpty ? [-1] : answer.sorted(by: <)
}

