struct Heap<T: Comparable> {
    private var nodes = [T]()
    private let sortFunction: (T, T) -> Bool
    
    public init(by sortFunction: @escaping (T, T) -> Bool) {
        self.sortFunction = sortFunction
    }
    
    mutating public func insert(_ newElement: T) {
        nodes.append(newElement)
        shiftUp(nodes.count - 1)
    }
    
    mutating public func remove() -> T? {
        if nodes.isEmpty { return nil }
        
        if nodes.count == 1 {
            return nodes.removeLast()
        } else {
            let value = nodes[0]
            nodes[0] = nodes.removeLast()
            shiftDown(0)
            return value
        }
    }
    
    mutating private func shiftUp(_ index: Int) {
        var childIndex = index
        var parentIndex = (index - 1) / 2
        
        while childIndex > 0 && sortFunction(nodes[childIndex], nodes[parentIndex]) {
            nodes.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating private func shiftDown(_ index: Int) {
        let leftChildIndex = index * 2 + 1
        let rightChildIndex = leftChildIndex + 1
        
        var target = index
        if leftChildIndex < nodes.count && sortFunction(nodes[leftChildIndex], nodes[target]) {
            target = leftChildIndex
        }
        
        if rightChildIndex < nodes.count && sortFunction(nodes[rightChildIndex], nodes[target]) {
            target = rightChildIndex
        }
        
        if target == index { return }
        
        nodes.swapAt(target, index)
        shiftDown(target)
    }
}

let str = readLine()!.split(separator: " ").map { Int($0)! }
let (n, h, t) = (str[0], str[1], str[2])

var heap = Heap<Int>(by: >)
var times = t

for _ in 0..<n {
    heap.insert(Int(readLine()!)!)
}

for i in 0..<t {
    let height = heap.remove()!
    
    if height < h {
        times = i
        heap.insert(height)
        break
    }
    
    if height / 2 < 1 {
        heap.insert(1)
    } else {
        heap.insert(height / 2)
    }
}

let height = heap.remove()!

if times != t || height < h {
    print("YES")
    print(times)
} else {
    print("NO")
    print(height)
}
