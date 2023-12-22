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

var isPrime = [Bool](repeating: true, count: 100_001)
isPrime[0] = false
isPrime[1] = false
for i in 2...50_000 {
    for j in stride(from: i * 2, through: 100_000, by: i) {
        isPrime[j] = false
    }
}

for _ in 0..<Int(readLine()!)! {
    let nab = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, a, b) = (nab[0], nab[1], nab[2])
    
    if isPrime[a...b].filter({ $0 }).count == 0 {
        print(-1)
        continue
    }
    
    var isVisited = [Bool](repeating: false, count: 1_000_001)
    isVisited[n] = true
    
    var q = Queue<(count: Int, snap: Int)>()
    q.enqueue((count: n, snap: 0))
    while !q.isEmpty {
        let info = q.dequeue()
        if (a...b).contains(info.count) && isPrime[info.count] {
            print(info.snap)
            break
        }
        
        var options = [Int]()
        if info.count > a {
            options.append(info.count / 3)
            options.append(info.count / 2)
        }
        if info.count < b {
            options.append(info.count + 1)
        }
        if info.count > 0 {
            options.append(info.count - 1)
        }
        for option in options where !isVisited[option] {
            isVisited[option] = true
            q.enqueue((count: option, snap: info.snap + 1))
        }
    }
}
