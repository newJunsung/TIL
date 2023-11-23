struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var count: Int { input.count + output.count }
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

let n = Int(readLine()!)!
var line = Queue<(name: String, number: Int)>()
for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map{ String($0) }
    line.enqueue((name: info[0], number: Int(info[1])!))
}

while line.count != 1 {
    let info = line.dequeue()
    for _ in 0..<(info.number - 1) {
        line.enqueue(line.dequeue())
    }
    let _ = line.dequeue()
}
print(line.dequeue().name)

