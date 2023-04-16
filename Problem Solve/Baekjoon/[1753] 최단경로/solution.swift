struct Heap<T> {
    private var array = [T]()
    private var sortFunction: (T, T) -> Bool
    
    var isEmpty: Bool { return array.isEmpty }
    
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

let ve = readLine()!.split(separator: " ").map { Int(String($0))! }
let k = Int(readLine()!)! - 1

var weights = [Int](repeating: Int.max, count: ve[0])
weights[k] = 0

var graph = [[(Int, Int)]](repeating: [], count: ve[0])
for _ in 0..<ve[1] {
    let uvw = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[uvw[0] - 1].append((uvw[1] - 1, uvw[2]))
}

var heap = Heap<(Int, Int)> { $0.1 < $1.1 }
heap.insert((k, 0))
while !heap.isEmpty {
    let info = heap.remove()!
    
    if weights[info.0] < info.1 { continue }
    
    for g in graph[info.0] {
        let weight = g.1 + info.1
        if weight < weights[g.0] {
            weights[g.0] = weight
            heap.insert((g.0, weight))
        }
    }
}

weights.forEach { weight in
    if weight == Int.max {
        print("INF")
    } else {
        print(weight)
    }
}
