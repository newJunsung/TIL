struct Heap<T> {
    private var nodes = [T]()
    private let order: (T, T) -> Bool
    
    var count: Int {
        return nodes.count
    }
    
    init(order: @escaping (T, T) -> Bool) {
        self.order = order
    }
    
    mutating func insert(_ newElement: T) {
        nodes.append(newElement)
        shiftUp()
    }
    
    mutating func remove() -> T? {
        if nodes.isEmpty {
            return nil
        }
        
        if nodes.count == 1 {
            return nodes.removeLast()
        }
        
        let value = nodes[0]
        nodes[0] = nodes.removeLast()
        shiftDown(0)
        return value
    }
    
    mutating private func shiftUp() {
        var childIndex = nodes.count - 1
        var parentIndex = (childIndex - 1) / 2
        
        while childIndex > 0 && order(nodes[childIndex], nodes[parentIndex]) {
            nodes.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating private func shiftDown(_ index: Int) {
        let leftChildIndex = index * 2 + 1
        let rightChildIndex = leftChildIndex + 1
        
        var target = index
        if leftChildIndex < nodes.count && order(nodes[leftChildIndex], nodes[target]) {
            target = leftChildIndex
        }
        
        if rightChildIndex < nodes.count && order(nodes[rightChildIndex], nodes[target]) {
            target = rightChildIndex
        }
        
        if target == index { return }
        
        nodes.swapAt(target, index)
        shiftDown(target)
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! } // nm[0]: N, nm[1]: M
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)

var answer = arr[0]
var heap = Heap<Int>(order: <)

for a in arr {
    if heap.count == nm[1] {
        let value = heap.remove()! + a
        heap.insert(value)
        answer = max(answer, value)
    } else {
        heap.insert(a)
    }
}

print(answer)
