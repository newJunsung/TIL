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
let st = readLine()!.split(separator: " ").map { Int($0)! }
let (s, t) = (st[0], st[1])

func bfs(_ s: Int, _ t: Int) -> String {
    if s == t { return "0" }
    
    var isVisited: Set<Int> = []
    var q = Queue<(val: Int, op: String)>()
    
    q.enqueue((s, ""))
    
    while !q.isEmpty {
        let (val, op) = q.dequeue()
        
        if val == t { return op }
        
        if val * val <= 1_000_000_000 && !isVisited.contains(val * val) {
            isVisited.insert(val * val)
            q.enqueue((val * val, op + "*"))
        }
        
        if val + val <= 1_000_000_000 && !isVisited.contains(val + val) {
            isVisited.insert(val + val)
            q.enqueue((val: val + val, op: op + "+"))
        }
        
        if !isVisited.contains(0) {
            isVisited.insert(0)
            q.enqueue((0, op + "-"))
        }
        
        if !isVisited.contains(1) {
            isVisited.insert(1)
            q.enqueue((1, op + "/"))
        }
    }
    
    return "-1"
}

print(bfs(s, t))
