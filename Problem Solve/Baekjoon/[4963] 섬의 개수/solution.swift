func dfs(h: Int, w: Int, graph: [[Int]], isVisited: inout [[Bool]], height: Int, width: Int) {
    isVisited[h][w] = true
    
    let y = [0, 0, -1, 1, -1, -1, 1, 1]
    let x = [-1, 1, 0, 0, -1, 1, -1, 1]
    
    for i in 0..<8 {
        let tempY = h + y[i]
        let tempX = w + x[i]
        
        if !(0..<height).contains(tempY) || !(0..<width).contains(tempX) {
            continue
        }
        
        if graph[tempY][tempX] == 1 && !isVisited[tempY][tempX] {
            dfs(h: tempY, w: tempX, graph: graph, isVisited: &isVisited, height: height, width: width)
        }
    }
}

var answer = ""
while true {
    let wh = readLine()!.split(separator: " ").map { Int($0)! }
    if wh == [0, 0] { break }
    let width = wh[0], height = wh[1]
    
    var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: width), count: height)
    var graph = [[Int]](repeating: [], count: height)
    for i in 0..<height {
        graph[i] = readLine()!.split(separator: " ").map { Int($0)! }
    }
    
    var count = 0
    for h in 0..<height {
        for w in 0..<width {
            if graph[h][w] == 1 && !isVisited[h][w] {
                count += 1
                dfs(h: h, w: w, graph: graph, isVisited: &isVisited, height: height, width: width)
            }
        }
    }
    answer += "\(count)\n"
}
print(answer)
