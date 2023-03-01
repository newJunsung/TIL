import Foundation

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
    mutating func enqueue(_ element: T) {
        input.append(element)
    }
    
    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        
        return output.popLast()
    }
}

func bfs(from start: Int, to end: Int, isVisted: inout [Bool], graph: [[Int]]) -> Int {
    var queue = Queue<[Int]>()
    queue.enqueue([start, 0])
    
    while !queue.isEmpty {
        let node = queue.dequeue()!
        isVisted[node[0]] = true
        
        if node[0] == end {
            return node[1]
        }
        
        for n in graph[node[0]] {
            if !isVisted[n] {
                queue.enqueue([n, node[1] + 1])
            }
        }
    }
    
    return 0
}

let str = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (str[0], str[1])

var isVisited = [Bool](repeating: false, count: 100_001)
var graph = [[Int]](repeating: [Int](), count: 100_001)

for i in 0...100_000 {
    if (i - 1) >= 0 {
        if !graph[i].contains(i - 1) {
            graph[i].append(i - 1)
        }
    }
    
    if (i + 1) <= 100_000 {
        if !graph[i].contains(i + 1) {
            graph[i].append(i + 1)
        }
    }
    
    if (i * 2) <= 100_000 {
        if !graph[i].contains(i * 2) {
            graph[i].append(i * 2)
        }
    }
}

let answer = bfs(from: n, to: k, isVisted: &isVisited, graph: graph)
print(answer)
