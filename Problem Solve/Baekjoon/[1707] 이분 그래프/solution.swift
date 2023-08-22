for _ in 0..<Int(readLine()!)! {
    let ve = readLine()!.split(separator: " ").map { Int($0)! }
    let (v, e) = (ve[0], ve[1])
    
    var isVisited = [Int](repeating: 0, count: v)
    var g = [[Int]](repeating: [], count: v)
    for _ in 0..<e {
        let info = readLine()!.split(separator: " ").map { Int($0)! - 1 }
        g[info[0]].append(info[1])
        g[info[1]].append(info[0])
    }
    
    var isB = true
    func dfs(_ start: Int, check: Bool) {
        isVisited[start] = check ? 1 : -1
        
        for v in g[start] {
            if isVisited[start] == isVisited[v] {
                isB = false
                return
            }
            if isVisited[v] == 0 {
                dfs(v, check: !check)
            }
        }
    }
    
    for i in 0..<v {
        if isVisited[i] == 0 {
            dfs(i, check: true)
        }
        if !isB {
            break
        }
    }
    print(isB ? "YES": "NO")
}
