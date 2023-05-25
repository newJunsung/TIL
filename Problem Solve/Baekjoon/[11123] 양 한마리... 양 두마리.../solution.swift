struct Queue<T> {
    var input = [T]()
    var output = [T]()
    
    var isEmpty: Bool { input.isEmpty && output.isEmpty }
    
    mutating func append(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func remove() -> T? {
        if output.isEmpty && input.isEmpty { return nil }
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        
        return output.removeLast()
    }
}

let my = [-1, 1 ,0, 0]
let mx = [0, 0, -1, 1]

let t = Int(readLine()!)!
for _ in 0..<t {
    let hw = readLine()!.split(separator: " ").map { Int($0)! }
    
    var graph = [[String]](repeating: [], count: hw[0])
    for i in 0..<hw[0] {
        graph[i] = readLine()!.map{ String($0) }
    }
    
    var count = 0
    var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: hw[1]), count: hw[0])
    var queue = Queue<(Int, Int)>()
    for i in 0..<hw[0] {
        for j in 0..<hw[1] {
            if graph[i][j] == "#" && !isVisited[i][j] {
                count += 1
                isVisited[i][j] = true
                queue.append((i, j))
                while !queue.isEmpty {
                    let (y, x) = queue.remove()!
                    
                    for m in 0..<4 {
                        let tempY = y + my[m]
                        let tempX = x + mx[m]
                        
                        if (0..<hw[0]).contains(tempY) && (0..<hw[1]).contains(tempX) {
                            if graph[tempY][tempX] == "#" && !isVisited[tempY][tempX] {
                                isVisited[tempY][tempX] = true
                                queue.append((tempY, tempX))
                            }
                        }
                    }
                }
            }
        }
    }
    print(count)
}
