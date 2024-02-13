import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var h = Heap<(time: Int, work: Int)> {
        return $0.work < $1.work
    }
    
    var result = 0, index = 0
    var start = -1, end = 0
    
    while index < jobs.count {
        for job in jobs[index..<jobs.count] {
            if ((start + 1)...end).contains(job[0]) {
                h.enheap((job[0], job[1]))
            }
        }
        
        guard let now = h.deheap() else {
            end += 1
            continue
        }
        start = end
        end += now.work
        result += end - now.time
        index += 1
    }
    
    return result / jobs.count
}

struct Heap<T> {
    private var arr = [T]()
    let cmp: (T, T) -> Bool
    
    var isEmpty: Bool { arr.isEmpty }
    var top: T? { arr.first }
    
    init(cmp: @escaping (T, T) -> Bool) {
        self.cmp = cmp
    }
    
    mutating func enheap(_ newElement: T) {
        arr.append(newElement)
        var child = arr.count - 1
        var parent = (child - 1) / 2
        
        while child > 0 && cmp(arr[child], arr[parent]) {
            arr.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    mutating func deheap() -> T? {
        if arr.count <= 1 {
            return arr.popLast()
        }
        
        let value = arr[0]
        arr[0] = arr.removeLast()
        
        var index = 0
        while true {
            let leftChild = index * 2 + 1
            let rightChild = leftChild + 1
            
            var target = index
            if leftChild < arr.count && cmp(arr[leftChild], arr[target]) {
                target = leftChild
            }
            
            if rightChild < arr.count && cmp(arr[rightChild], arr[target]) {
                target = rightChild
            }
            
            if target == index { break }
            arr.swapAt(target, index)
            index = target
        }
        
        return value
    }
}
