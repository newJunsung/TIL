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

let n = Int(readLine()!)!

var a = readLine()!.split(separator: " ").map { Int($0)! }
var jump = [Int](repeating: Int.max, count: n)
jump[0] = 0

var q = Queue<(miro: Int, count: Int)>()
q.enqueue((miro: 0, count: 0))
while !q.isEmpty {
    let info = q.dequeue()
    for i in 0..<a[info.miro] {
        if info.miro + i + 1 < a.count && info.count + 1 < jump[info.miro + i + 1] {
            jump[info.miro + i + 1] = info.count + 1
            q.enqueue((miro: info.miro + i + 1, count: info.count + 1))
        }
    }
}
print(jump[n - 1] == Int.max ? -1: jump[n - 1])
