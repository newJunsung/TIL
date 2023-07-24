import Foundation

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

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count = 0
    var queue = Queue<(Int, Int)>()
    queue.enqueue((0, 0))
    
    while !queue.isEmpty {
        let info = queue.dequeue()
        if info.0 == target && info.1 == numbers.count {
            count += 1
        }
        if (0...numbers.count).contains(info.1 + 1) {
            queue.enqueue((info.0 + numbers[info.1], info.1 + 1))
            queue.enqueue((info.0 - numbers[info.1], info.1 + 1))
        }
    }
    return count
}
