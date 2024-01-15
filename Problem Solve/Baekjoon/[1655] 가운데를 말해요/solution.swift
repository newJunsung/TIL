struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    var top: T { array[0] }
    var count: Int { array.count }
    
    init(array: [T] = [T](), compare: @escaping (T, T) -> Bool) {
        self.array = array
        self.compare = compare
    }
    
    mutating func enheap(_ newElement: T) {
        var childIndex = array.count
        var parentIndex = (childIndex - 1) / 2
        array.append(newElement)
        
        while childIndex > 0 && compare(array[childIndex], array[parentIndex]) {
            array.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1 ) / 2
        }
    }
    
    mutating func deheap() -> T {
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
            if index == target { break }
            
            array.swapAt(index, target)
            index = target
        }
        
        return value
    }
}

var result = ""
var maxHeap = Heap<Int>(compare: <)
var minHeap = Heap<Int>(compare: >)

for _ in 0..<Int(readLine()!)! {
    let num = Int(readLine()!)!
    
    if minHeap.count == 0 {
        minHeap.enheap(num)
    } else {
        if num > minHeap.top {
            maxHeap.enheap(num)
        } else {
            minHeap.enheap(num)
        }
        
        if minHeap.count == maxHeap.count + 2 {
            maxHeap.enheap(minHeap.deheap())
        } else if minHeap.count + 1 == maxHeap.count {
            minHeap.enheap(maxHeap.deheap())
        }
    }
    result += "\(minHeap.top)\n"
}
print(result)
