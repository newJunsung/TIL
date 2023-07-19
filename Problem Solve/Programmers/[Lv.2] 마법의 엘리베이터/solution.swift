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

func solution(_ storey:Int) -> Int {
    var count = Int.max
    var queue = Queue<(Int, Int)>()
    queue.enqueue((storey, 0))
    while !queue.isEmpty {
        let info = queue.dequeue()
        if (info.0 / 10 == 0) && (info.0 % 10 == 0) {
            count = min(count, info.1)
            continue
        }

        let leftNum = info.0 % 10
        let leftNum2 = 10 - info.0 % 10
        if leftNum > 5 {
            queue.enqueue(((info.0 + leftNum2) / 10, info.1 + leftNum2))
        } else if leftNum < 5 {
            queue.enqueue(((info.0 - leftNum) / 10, info.1 + leftNum))
        } else {
            queue.enqueue(((info.0 - leftNum) / 10, info.1 + leftNum))
            queue.enqueue(((info.0 + leftNum2) / 10, info.1 + leftNum2))
        }
    }
    return count
}
