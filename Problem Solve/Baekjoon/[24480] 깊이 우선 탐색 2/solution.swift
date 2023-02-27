import Foundation

let str = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, r) = (str[0], str[1], (str[2] - 1))

var node = [Bool](repeating: false, count: n)
var edge = [[Int]](repeating: [], count: n)
var procedure = [Int](repeating: 0, count: n)
var temp = 0

for _ in 0..<m {
    let e = readLine()!.split(separator: " ").map { Int($0)! }
    let (e1, e2) = ((e[0] - 1), (e[1] - 1))
    
    edge[e1].append(e2)
    edge[e2].append(e1)
}

for i in 0..<n {
    edge[i].sort { $0 > $1 }
}

dfs(node: &node, edge: edge, from: r)

for p in procedure {
    print(p)
}

func dfs(node: inout [Bool], edge: [[Int]], from start: Int) {
    node[start] = true
    
    temp += 1
    procedure[start] = temp
    
    edge[start].forEach { e in
        if !node[e] {
            dfs(node: &node, edge: edge, from: e)
        }
    }
}
