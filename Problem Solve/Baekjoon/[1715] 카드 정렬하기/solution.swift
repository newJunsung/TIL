struct Heap<T> {
    private var arr = [T]()
    private let comparer: (T, T) -> Bool
    
    var isEmpty: Bool { arr.isEmpty }
    var count: Int { arr.count }
    
    init(arr: [T] = [T](), comparer: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.comparer = comparer
    }
    
    mutating func append(_ newElement: T) {
        arr.append(newElement)
        
        var childIndex = arr.count - 1
        var parentIndex = (childIndex - 1) / 2
        while childIndex > 0 && comparer(arr[childIndex], arr[parentIndex]) {
            arr.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating func remove() -> T? {
        if arr.isEmpty { return nil }
        if arr.count == 1 { return arr.removeLast() }
        
        let value = arr[0]
        arr[0] = arr.removeLast()
        
        var index = 0
        while true {
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            
            var target = index
            if leftChildIndex < arr.count && comparer(arr[leftChildIndex], arr[target]) {
                target = leftChildIndex
            }
            if rightChildIndex < arr.count && comparer(arr[rightChildIndex], arr[target]) {
                target = rightChildIndex
            }
            if index == target { break }
            arr.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

let n = Int(readLine()!)!

var heap = Heap<Int>(comparer: <)
for _ in 0..<n {
    let num = Int(readLine()!)!
    if num == 0 {
        print(heap.remove() ?? 0)
    } else {
        heap.append(num)
    }
}
