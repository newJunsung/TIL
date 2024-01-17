struct Queue<T> {
    var input = [T]()
    var output = [T]()
    
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

var result = ""
for _ in 0..<Int(readLine()!)! {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (_, m) = (nm[0], nm[1])
    let docs = readLine()!.split(separator: " ").map { Int($0)! }
    
    var q = Queue<(index: Int, priority: Int)>()
    for (index, priority) in docs.enumerated() {
        q.enqueue((index, priority))
    }
    
    var count = 1
    while m != fetch() {
        count += 1
    }
    result += "\(count)\n"
    
    func fetch() -> Int {
        while true {
            let doc = q.dequeue()
            
            var check = false
            if !q.input.isEmpty {
                q.input.forEach { (index: Int, priority: Int) in
                    if doc.priority < priority {
                        check = true
                    }
                }
            }
            
            if !q.output.isEmpty {
                q.output.forEach { (index: Int, priority: Int) in
                    if doc.priority < priority {
                        check = true
                    }
                }
            }
            
            if check {
                q.enqueue(doc)
                continue
            }
            
            return doc.index
        }
    }
}
print(result)

