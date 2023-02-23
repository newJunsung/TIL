import Foundation

let n = Int(readLine()!)!
let l = Int(readLine()!)!

var nodes = [Bool](repeating: false, count: n + 1)
var lines = [[Int]](repeating: [], count: n + 1)

for _ in 1...l {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    lines[line[0]].append(line[1])
    lines[line[1]].append(line[0])
}

dfs(from: 1)

print(nodes.filter { $0 }.count - 1)

func dfs(from start: Int) {
    nodes[start] = true
    
    for line in lines[start] {
        if !nodes[line] {
            dfs(from: line)
        }
    }
}
