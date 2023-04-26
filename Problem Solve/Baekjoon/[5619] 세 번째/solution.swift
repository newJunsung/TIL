struct Heap<T> {
    private var array = [T]()
    private let sortFunction: (T, T) -> Bool
    
    var peek: T? {
        if array.isEmpty {
            return nil
        }
        return array[0]
    }
    var isEmpty: Bool { array.isEmpty }
    var count: Int { array.count }
    
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
    
    @discardableResult
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
            
            if target == index {
                break
            }
            
            array.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

let n = Int(readLine()!)!

var heap = Heap<Int>(sortFunction: <)
for _ in 0..<n {
    heap.insert(Int(readLine()!)!)
}

var array = [Int]()
if n < 4 {
    for _ in 0..<n {
        array.append(heap.remove()!)
    }
} else {
    for _ in 0..<4 {
        array.append(heap.remove()!)
    }
}

var answer = [Int]()
for i in 0..<(array.count - 1) {
    for j in (i + 1)..<array.count {
        answer.append(Int(String(array[i]) + String(array[j]))!)
        answer.append(Int(String(array[j]) + String(array[i]))!)
    }
}
answer.sort()
print(answer[2])
