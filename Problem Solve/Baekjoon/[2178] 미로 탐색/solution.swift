import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var str: [[String]] = Array(repeating: [], count: n)
var graph: [[Int]] = Array(repeating: [], count: (n * m))
var isVisited: [Bool] = Array(repeating: false, count: (n * m))

for i in 0..<n {
    let s = readLine()!.map { String($0) }
    str[i] = s
}

for i in 0..<n {
    for c in 0..<m {
        let index = i * m + c

        if c > 0 {
            if str[i][c] == "1" && str[i][c - 1] == "1"  {
                graph[index - 1].append(index)
                graph[index].append(index - 1)
            }
        }

        if i > 0 {
            if str[i][c] == "1" && str[i - 1][c] == "1" {
                let temp = (i - 1) * m + c
                graph[index].append(temp)
                graph[temp].append(index)
            }
        }
    }
}

let answer = bfs(from: 0, to: (n * m - 1), isVisited: &isVisited, graph: &graph)
print(answer)

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
    mutating func enqueue(_ item: T) {
        input.append(item)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        
        return output.popLast()
    }
}

func bfs(from start: Int, to end: Int, isVisited: inout [Bool], graph: inout [[Int]]) -> Int {
    var queue = Queue<[Int]>()
    queue.enqueue([start, 1])
    isVisited[start] = true
    
    while !queue.isEmpty {
        let node = queue.dequeue()!
        
        if node[0] == end {
            return node[1]
        }
        
        for i in graph[node[0]] {
            if !isVisited[i] {
                queue.enqueue([i, (node[1] + 1)])
                isVisited[i] = true
            }
        }
    }
    
    return -1
}
