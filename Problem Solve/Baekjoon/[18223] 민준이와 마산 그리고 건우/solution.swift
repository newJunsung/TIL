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

let vep = readLine()!.split(separator: " ").map { Int($0)! }
let (v, e, p) = (vep[0], vep[1], vep[2] - 1)

var vertexes = [[(vertex: Int, distance: Int)]](repeating: [(vertex: Int, distance: Int)](), count: v)
for _ in 0..<e {
    let info = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (a, b, c) = (info[0], info[1], info[2] + 1)
    
    vertexes[a].append((vertex: b, distance: c))
    vertexes[b].append((vertex: a, distance: c))
}

var check = [Int](repeating: Int.max, count: v)
check[0] = 0

var heap = Heap<(vertex: Int, distance: Int)> { $0.distance < $1.distance }
heap.enheap((0, 0))

while !heap.isEmpty {
    let info = heap.deheap()!
    
    for edge in vertexes[info.vertex] {
        let newDistance = info.distance + edge.distance
        
        if newDistance < check[edge.vertex] {
            check[edge.vertex] = newDistance
            heap.enheap((vertex: edge.vertex, distance: newDistance))
        }
    }
}

var check2 = [Int](repeating: Int.max, count: v)
check2[p] = 0
heap.enheap((vertex: p, distance: 0))
while !heap.isEmpty {
    let info = heap.deheap()!
    
    for edge in vertexes[info.vertex] {
        let newDistance = info.distance + edge.distance
        
        if newDistance < check2[edge.vertex] {
            check2[edge.vertex] = newDistance
            heap.enheap((vertex: edge.vertex, distance: newDistance))
        }
    }
}

let d1 = check[p] + check2[v - 1]
let d2 = check[v - 1]
print(d1 == d2 ? "SAVE HIM" : "GOOD BYE")
