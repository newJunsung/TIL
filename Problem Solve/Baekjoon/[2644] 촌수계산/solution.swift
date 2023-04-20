let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let m = Int(readLine()!)!

var graph = [[Int]](repeating: [], count: n)
for _ in 0..<m {
    let edge = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[edge[1] - 1].append(edge[0] - 1)
    graph[edge[0] - 1].append(edge[1] - 1)
}

var isVisited = [Bool](repeating: false, count: n)
isVisited[input[0] - 1] = true

var queue = [(Int, Int)]()
queue.append(((input[0] - 1), 1))

var answer = -1
var index = 0
while index < queue.count {
    let node = queue[index]
    index += 1
    
    for g in graph[node.0] {
        if g == (input[1] - 1) {
            answer = node.1
            index = queue.count
            break
        }
        
        if !isVisited[g] {
            isVisited[g] = true
            queue.append((g, node.1 + 1))
        }
    }
}

print("\(answer)")
