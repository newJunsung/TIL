import Foundation

struct Queue<T> {
    private var input: [T] = []
    private var output: [T] = []
    
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
    
    mutating func removeAll() {
        input.removeAll()
        output.removeAll()
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var graph = [[Int]](repeating: [], count: 101)
var isVisited = [Bool](repeating: false, count: 101)

for _ in 0..<(n + m) {
    let index = readLine()!.split(separator: " ").map { Int($0)! }
    graph[Int(index[0])].append(index[1])
}

var count: Int = 0
var queue = Queue<[Int]>()
queue.enqueue([1, 0])

while !queue.isEmpty {
    let player = queue.dequeue()!
    count = player[1]
    
    for i in 1...6 {
        if (Int(player[0]) + i) == 100 {
            queue.removeAll()
            count += 1
            break
        }
        
        if isVisited[player[0] + i] {
            continue
        }
        
        if graph[Int(player[0]) + i].isEmpty {
            queue.enqueue([player[0] + i, count + 1])
            isVisited[player[0] + i] = true
        } else {
            graph[player[0] + i].forEach { queue.enqueue([$0, count + 1]) }
            isVisited[player[0] + (i)] = true
        }
    }
}

print(count)
