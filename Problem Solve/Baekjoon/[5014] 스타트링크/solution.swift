struct Deque<T> {
    var input = [T]()
    var output = [T]()
    
    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }
    
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

let fsgud = readLine()!.split(separator: " ").map { Int($0)! }
// (0: F), (1: S), (2: G), (3: U), (4: D)

var answer = "use the stairs"
var isVisited = [Bool](repeating: false, count: fsgud[0] + 1)
var deque = Deque<(floor: Int, count: Int)>()

isVisited[0] = true
deque.insert((floor: fsgud[1], count: 0))

while !deque.isEmpty {
    let info = deque.remove()!
    
    if info.floor == fsgud[2] {
        answer = "\(info.count)"
        break
    }
    
    let up = info.floor + fsgud[3]
    let down = info.floor - fsgud[4]
    
    if up <= fsgud[0] && up >= 1 && !isVisited[up] {
        isVisited[up] = true
        deque.insert((floor: info.floor + fsgud[3], count: info.count + 1))
    }
    
    if down <= fsgud[0] && down >= 1 && !isVisited[down] {
        isVisited[down] = true
        deque.insert((floor: info.floor - fsgud[4], count: info.count + 1))
    }
}

print(answer)
