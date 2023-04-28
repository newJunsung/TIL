struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool { input.isEmpty && output.isEmpty }
    
    mutating func insert(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func remove() -> T? {
        if self.isEmpty { return nil }
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}

let nk = readLine()!.split(separator: " ").map { Int($0)! }
var queue = Queue<Int>()
for i in 1...nk[0] {
    queue.insert(i)
}

var answer = ""
var count = 0
while !queue.isEmpty {
    count += 1
    let num = queue.remove()!
    if count == nk[1] {
        answer += "\(num), "
        count = 0
    } else {
        queue.insert(num)
    }
}
answer.removeLast()
answer.removeLast()
print("<\(answer)>")
