import Foundation

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        
        return output.removeLast()
    }
    
    mutating func removeAll() {
        output.removeAll()
        input.removeAll()
    }
}

func solution(_ maps:[String]) -> Int {
    let y = maps.count
    let x = maps[0].count
    
    let my = [-1, 1 ,0, 0]
    let mx = [0, 0, -1, 1]

    var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: x), count: y)
    var queue = Queue<(y: Int, x: Int, second: Int)>()
    
    var sy = 0
    var sx = 0
    let graph = maps.map { temp -> [String] in
        sx = 0
        var arr = temp.map { char -> String in
            if char == "S" {
                isVisited[sy][sx] = true
                queue.enqueue((y: sy, x: sx, second: 0))
            }
            
            sx += 1
            return String(char)
        }
        sy += 1
        return arr
    }
    
    var lSecond = -1
    while !queue.isEmpty {
        let info = queue.dequeue()
        if graph[info.y][info.x] == "L" {
            sy = info.y
            sx = info.x
            lSecond = info.second
            break
        }
        
        for i in 0..<4 {
            let ty = info.y + my[i]
            let tx = info.x + mx[i]
            
            if (0..<y).contains(ty) && (0..<x).contains(tx) {
                if graph[ty][tx] != "X" && !isVisited[ty][tx] {
                    isVisited[ty][tx] = true
                    queue.enqueue((y: ty, x: tx, second: info.second + 1))
                }
            }
        }
    }
    
    if lSecond < 0 {
        return -1
    }
    
    queue.removeAll()
    queue.enqueue((y: sy, x: sx, second: lSecond))
    isVisited = [[Bool]](repeating: [Bool](repeating: false, count: x), count: y)
    while !queue.isEmpty {
        let info = queue.dequeue()
        if graph[info.y][info.x] == "E" {
            return info.second
        }
        
        for i in 0..<4 {
            let ty = info.y + my[i]
            let tx = info.x + mx[i]
            
            if (0..<y).contains(ty) && (0..<x).contains(tx) {
                if graph[ty][tx] != "X" && !isVisited[ty][tx] {
                    isVisited[ty][tx] = true
                    queue.enqueue((y: ty, x: tx, second: info.second + 1))
                }
            }
        }
    }
    
    return -1
}
