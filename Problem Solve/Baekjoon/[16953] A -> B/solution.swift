struct Queue<T> {
    var input = [T]()
    var output = [T]()
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

let s = readLine()!.split(separator: " ").map { Int($0)! }
let (a, b) = (s[0], s[1])
var result = -1

var queue = Queue<(num: Int, count: Int)>()
queue.enqueue((num: a, count: 0))
while !queue.isEmpty {
    let info = queue.dequeue()
    if info.num > b {
        continue
    } else if info.num == b {
        result = info.count + 1
        break
    } else {
        queue.enqueue((num: info.num * 2, count: info.count + 1))
        queue.enqueue((num: info.num * 10 + 1, count: info.count + 1))
    }
}
print(result)
