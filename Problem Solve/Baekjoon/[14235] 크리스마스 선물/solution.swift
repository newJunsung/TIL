struct Heap<T: Comparable> {
    var array = [T]()
    let sortFunction: (T, T) -> Bool
    
    init(sortFunction: @escaping (T, T) -> Bool) {
        self.sortFunction = sortFunction
    }
    
    mutating public func insert(_ newElement: T) {
        array.append(newElement)
        shiftUp(array.count - 1)
    }
    
    mutating public func remove() -> T? {
        if array.isEmpty {
            return nil
        }
        
        if array.count == 1 {
            return array.removeLast()
        }
        
        let value = array[0]
        array[0] = array.removeLast()
        shiftDown(0)
        return value
    }
    
    mutating private func shiftUp(_ index: Int) {
        var childIndex = index
        var parentIndex = (index - 1) / 2
        
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
        
        if target == index {
            return
        }
        
        array.swapAt(index, target)
        shiftDown(target)
    }
}

let n = Int(readLine()!)!
var heap = Heap<Int>(sortFunction: >)

for _ in 0..<n {
    let a = readLine()!.split(separator: " ").map { Int($0)! }
    
    if a[0] == 0 {
        if let present = heap.remove() {
            print(present)
        } else {
            print(-1)
        }
    } else {
        for i in 1..<a.count {
            heap.insert(a[i])
        }
    }
}
