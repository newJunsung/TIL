struct Heap<T> {
    private var array = [T]()
    private let sortFunction: (T, T) -> Bool
    
    var isEmpty: Bool { array.isEmpty }
    
    init(array: [T] = [T](), sortFunction: @escaping (T, T) -> Bool) {
        self.array = array
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
let n = nm[0], m = nm[1]

var graph = [[(vertex: Int, weight: Int)]](repeating: [], count: n)
for _ in 0..<m {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    graph[info[0] - 1].append((vertex: info[1] - 1, weight: info[2]))
    graph[info[1] - 1].append((vertex: info[0] - 1, weight: info[2]))
}

var weights = [Int](repeating: Int.max, count: n)
weights[0] = 0

var heap = Heap<(vertex: Int, weight: Int)> { $0.weight < $1.weight }
heap.insert((vertex: 0, weight: 0))

while !heap.isEmpty {
    let info = heap.remove()!
    if weights[info.vertex] < info.weight { continue }
    
    for g in graph[info.vertex] {
        let weight = g.weight + info.weight
        if weight < weights[g.vertex] {
            weights[g.vertex] = weight
            heap.insert((vertex: g.vertex, weight: weight))
        }
    }
}

print(weights.max()!)
