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

func bfs(graph: inout [[Int]], ripeLocation: [(Int, Int)], m: Int, n: Int) -> Int{
    var queue = Queue<[Int]>()
    for location in ripeLocation {
        queue.enqueue([location.0, location.1, 0])
    }
    
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    var tomato = [0, 0, 0]
    
    while !queue.isEmpty {
        tomato = queue.dequeue()!
        
        for i in 0..<4 {
            let x = tomato[0] - dx[i]
            let y = tomato[1] - dy[i]
            
            if x < 0 || x >= m || y < 0 || y >= n {
                continue
            }
            
            if graph[y][x] == 0 {
                graph[y][x] = 1
                queue.enqueue([x, y, tomato[2] + 1])
            }
        }
    }
    
    for g in graph {
        if g.contains(0) {
            return -1
        }
    }
    
    return tomato[2]
}

let mn = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n) = (mn[0], mn[1])

var isAllRipe = true
var box: [[Int]] = Array(repeating: [], count: n)
var ripeLocation: [(Int, Int)] = []

for i in 0..<n {
    var tempM = 0
    let tomatos = readLine()!.split(separator: " ").map { (status) -> Int in
        if isAllRipe && status != "-1" && status == "0" {
            isAllRipe = false
        }

        if status == "1" {
            ripeLocation.append((tempM, i))
        }
        tempM += 1

        return Int(status)!
    }

    box[i] = tomatos
}

if isAllRipe {
    print(0)
} else {
    let answer = bfs(graph: &box, ripeLocation: ripeLocation, m: m, n: n)
    print(answer)
}
