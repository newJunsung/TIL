struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool { input.isEmpty && output.isEmpty }
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        return output.removeLast()
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var bridges = [[Int: Int]](repeating: [:], count: n)
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (a, b, c) = (abc[0], abc[1], abc[2] + 1)
    
    if let t = bridges[a][b] {
        bridges[a][b] = max(t, c)
    } else {
        bridges[a][b] = c
    }
    
    if let t = bridges[b][a] {
        bridges[b][a] = max(t, c)
    } else {
        bridges[b][a] = c
    }
}

let factories = readLine()!.split(separator: " ").map { Int($0)! - 1 }
let (factory1, factory2) = (factories[0], factories[1])

func bfs(_ payload: Int) -> Bool {
    var isVisited = [Bool](repeating: false, count: n)
    isVisited[factory1] = true
    
    var queue = Queue<Int>()
    queue.enqueue(factory1)
    
    while !queue.isEmpty {
        let island = queue.dequeue()
        
        if island == factory2 {
            return true
        }
        
        for (newIsland, newWeight) in bridges[island] {
            if !isVisited[newIsland] && payload <= newWeight {
                isVisited[newIsland] = true
                queue.enqueue(newIsland)
            }
        }
    }
    
    return false
}

var left = 1
var right = 1_000_000_000

while left <= right {
    let mid = (left + right) / 2
    
    if bfs(mid) {
        left = mid + 1
    } else {
        right = mid - 1
    }
}
print(right)
