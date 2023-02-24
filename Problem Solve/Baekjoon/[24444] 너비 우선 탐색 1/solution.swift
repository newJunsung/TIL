import Foundation

let str = readLine()!.split(separator: " ").map { Int($0)! }
let n = str[0], e = str[1], start = str[2]

var nodes = [Bool](repeating: false, count: n + 1)
var edges = [[Int]](repeating: [], count: n + 1)
var procedure = [Int](repeating: 0, count: n + 1)

for _ in 0..<e {
    let s = readLine()!.split(separator: " ").map { Int($0)! }
    
    edges[s[0]].append(s[1])
    edges[s[1]].append(s[0])
}

for i in 1...n {
    edges[i].sort { $0 < $1 }
}

bfs(from: start)

for i in 1...n {
    print(procedure[i])
}

func bfs(from start: Int) {
    var nextNode = Queue<Int>()
    nextNode.enqueue(start)
    
    var count = 1
    
    nodes[start] = true
    procedure[start] = count
    
    while !nextNode.isEmpty {
        let n = nextNode.dequeue()
        
        for e in edges[n] {
            if !nodes[e] {
                nodes[e] = true
                nextNode.enqueue(e)
                count += 1
                procedure[e] = count
            }
            
        }
    }
}

struct Queue<T: Comparable> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
    mutating func enqueue(_ item: T) {
        input.append(item)
    }
    
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        
        return output.popLast()!
    }
}
