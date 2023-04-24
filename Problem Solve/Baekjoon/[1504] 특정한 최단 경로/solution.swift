struct Heap<T> {
    private var array = [T]()
    private let sortFuction: (T, T) -> Bool
    var isEmpty: Bool { array.isEmpty }
    
    init(sortFuction: @escaping (T, T) -> Bool) {
        self.sortFuction = sortFuction
    }
    
    mutating func insert(_ newElement: T) {
        array.append(newElement)
        
        var childIndex = array.count - 1
        var parentIndex = (childIndex - 1) / 2
        while childIndex > 0 && sortFuction(array[childIndex], array[parentIndex]) {
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
            if leftChildIndex < array.count && sortFuction(array[leftChildIndex], array[target]) {
                target = leftChildIndex
            }
            if rightChildIndex < array.count && sortFuction(array[rightChildIndex], array[target]) {
                target = rightChildIndex
            }
            
            if target == index { break }
            array.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

let ne = readLine()!.split(separator: " ").map { Int($0)! }
var graph = [[(n: Int, w: Int)]](repeating: [], count: ne[0])
for _ in 0..<ne[1] {
    let abc = readLine()!.split(separator: " ").map { Int(String($0))! }
    let (a, b, c) = (abc[0] - 1, abc[1] - 1, abc[2])
    
    graph[a].append((n: b, w: c))
    graph[b].append((n: a, w: c))
}

let v1v2 = readLine()!.split(separator: " ").map { Int($0)! }
let (v1, v2) = (v1v2[0] - 1, v1v2[1] - 1)

let w1 = dijk(graph: graph, v1)
let w2 = dijk(graph: graph, v2)

let temp1 = w1[0] + w1[v2] + w2[ne[0] - 1]
let temp2 = w2[0] + w1[v2] + w1[ne[0] - 1]

if temp1 > 8_000_000 && temp2 > 8_000_000 {
    print(-1)
} else {
    print(min(temp1, temp2))
}

func dijk(graph: [[(n: Int, w: Int)]], _ start: Int) -> [Int] {
    var weights = [Int](repeating: 100_000_000, count: ne[0])
    weights[start] = 0

    var heap = Heap<(n: Int, w: Int)> { $0.w < $1.w }
    heap.insert((n: start, w: 0))
    
    while !heap.isEmpty {
        let info = heap.remove()!
        if weights[info.n] < info.w { continue }
        
        for g in graph[info.n] {
            let weight = g.w + info.w
            if weight < weights[g.n] {
                weights[g.n] = weight
                heap.insert((n: g.n, w: weight))
            }
        }
    }
    
    return weights
}
