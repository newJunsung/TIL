struct Heap<T> {
    private var array = [T]()
    private let sortFunction: (T, T) -> Bool
    var isEmpty: Bool { array.isEmpty }
    
    init(sortFunction: @escaping (T, T) -> Bool) {
        self.sortFunction = sortFunction
    }
    
    mutating func insert(_ newElement: T) {
        array.append(newElement)
        
        var childIndex = array.count - 1
        var parentIndex = (childIndex - 1) / 2
        while childIndex > 0 && sortFunction(array[childIndex], array[parentIndex]) {
            array.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating func remove() -> T? {
        if array.isEmpty { return nil }
        if array.count == 1 { return array.removeLast() }
        
        let value = array[0]
        array[0] = array.removeLast()
        
        var index = 0
        while true {
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            
            var target = index
            if leftChildIndex < array.count && sortFunction(array[leftChildIndex], array[target]) {
                target = leftChildIndex
            }
            
            if rightChildIndex < array.count && sortFunction(array[rightChildIndex], array[target]) {
                target = rightChildIndex
            }
            
            if target == index { break }
            
            array.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }

var heap = Heap<Int>(sortFunction: <)
readLine()!.split(separator: " ").forEach { num in
    heap.insert(Int(num)!)
}

for _ in 0..<nm[1] {
    let x = heap.remove()!
    let y = heap.remove()!
    
    heap.insert(x + y)
    heap.insert(x + y)
}

var sum = 0
for _ in 0..<nm[0] {
    sum += heap.remove()!
}
print(sum)
