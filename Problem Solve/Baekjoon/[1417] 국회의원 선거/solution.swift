struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    var top: T? { array.isEmpty ? nil : array[0] }
    var isEmpty: Bool { array.isEmpty }
    
    init(by compare: @escaping (T, T) -> Bool) {
        self.compare = compare
    }
    
    mutating func enheap(_ newElement: T) {
        var childIndex = array.count
        var parentIndex = (childIndex - 1) / 2
        array.append(newElement)
        
        while childIndex > 0 && compare(array[childIndex], array[parentIndex]) {
            array.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating func deheap() -> T? {
        if array.isEmpty {
            return nil
        }
        
        if array.count == 1 {
            return array.removeLast()
        }
        
        let value = array[0]
        array[0] = array.removeLast()
        
        var index = 0
        while true {
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            var target = index
            
            if leftChildIndex < array.count && compare(array[leftChildIndex], array[target]) {
                target = leftChildIndex
            }
            if rightChildIndex < array.count && compare(array[rightChildIndex], array[target]) {
                target = rightChildIndex
            }
            if target == index {
                break
            }
            
            array.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

var heap = Heap<Int>(by: >)

let n = Int(readLine()!)!
var dasom = Int(readLine()!)!
for _ in 0..<(n - 1) {
    heap.enheap(Int(readLine()!)!)
}

var result = 0
while let count = heap.deheap(), dasom <= count {
    dasom += 1
    result += 1
    if count - 1 > 0 {
        heap.enheap(count - 1)
    }
}
print(result)
