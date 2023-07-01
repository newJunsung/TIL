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

let nk = readLine()!.split(separator: " ").map { Int($0)! }

var stairs = [Bool](repeating: false, count: nk[0] + 1)
stairs[0] = true

var count = 0
var q = Queue<(stair: Int, count: Int)>()
q.enqueue((stair: 0, count: 0))
while !q.isEmpty {
    let info = q.dequeue()
    if info.stair == nk[0] {
        count = info.count
        break
    }
    
    let next1 = info.stair + info.stair / 2
    if next1 <= nk[0] && !stairs[next1] {
        stairs[next1] = true
        q.enqueue((stair: next1, count: info.count + 1))
    }
    
    let next2 = info.stair + 1
    if next2 <= nk[0] && !stairs[next2] {
        stairs[next2] = true
        q.enqueue((stair: next2, count: info.count + 1))
    }
}
count <= nk[1] ? print("minigimbob") : print("water")
