struct Heap<T: Comparable> {
    private var array = [T]()
    private var sortFunction: (T, T) -> Bool
    
    init(sortFunction: @escaping (T, T) -> Bool) {
        self.sortFunction = sortFunction
    }
    
    mutating public func insert(_ newElement: T) {
        array.append(newElement)
        shiftUp()
    }
    
    mutating public func remove() -> T? {
        if array.isEmpty { return nil }
        if array.count == 0 { return array.removeLast() }
        
        let value = array[0]
        array[0] = array.removeLast()
        shiftDown(0)
        return value
    }
    
    mutating private func shiftUp() {
        var childIndex = array.count - 1
        var parentIndex = (childIndex - 1) / 2
        
        while childIndex > 0 && sortFunction(array[childIndex], array[parentIndex]) {
            array.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating private func shiftDown(_ index: Int) {
        let leftChildIndex = index * 2 + 1
        let rightChildIndex = leftChildIndex + 1
        
        var target = index
        if leftChildIndex < array.count && sortFunction(array[leftChildIndex], array[target]) {
            target = leftChildIndex
        }
        if rightChildIndex < array.count && sortFunction(array[rightChildIndex], array[target]) {
            target = rightChildIndex
        }
        
        if target == index { return }
        array.swapAt(index, target)
        shiftDown(target)
    }
}

let nm = readLine()!

var heap = Heap<Int>(sortFunction: >)
var isSatisfied = true

readLine()!.split(separator: " ").forEach { heap.insert(Int($0)!) }
readLine()!.split(separator: " ").forEach { char in
    let w = Int(char)!
    let c = heap.remove() ?? 0
    
    if (c - w) < 0 {
        isSatisfied = false
    } else if (c - w) > 0 {
        heap.insert(c - w)
    }
}

if isSatisfied {
    print(1)
} else {
    print(0)
}
