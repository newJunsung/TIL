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
            input.removeAll()
        }
        return output.removeLast()
    }
}

let c = Int(readLine()!)!
for _ in 0..<c {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    
    var q = Queue<(g: Int, count: Int, j: Int)>()
    q.enqueue((g: info[0], count: 0, j: info[1]))
    while !q.isEmpty {
        let temp = q.dequeue()
        if temp.g > temp.j {
            continue
        }
        
        if temp.g == temp.j {
            print(temp.count)
            break
        }
        
        q.enqueue((g: temp.g + 1, count: temp.count + 1, j: temp.j))
        q.enqueue((g: temp.g * 2, count: temp.count + 1, j: temp.j + 3))
    }
}
