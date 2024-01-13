struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    var isEmpty: Bool { array.isEmpty }
    
    init(compare: @escaping (T, T) -> Bool) {
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
    
    mutating func deheap() -> T {
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
            if index == target { break }
            
            array.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var edges = [[(vertex: Int, weight: Int)]](repeating: [], count: n)
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (a, b, c) = (abc[0], abc[1], abc[2] + 1)
    
    edges[a].append((vertex: b, weight: c))
    edges[b].append((vertex: a, weight: c))
}

var weights = [Int](repeating: Int.max, count: n)
weights[1] = 0

var heap = Heap<(vertex: Int, weight:Int)> { $0.weight < $1.weight }
heap.enheap((vertex: 1, weight: 0))

while !heap.isEmpty {
    let info = heap.deheap()
    if info.weight > weights[info.vertex] { continue }
    
    for (vertex, weight) in edges[info.vertex] {
        let newWeight = weight + info.weight
        if newWeight < weights[vertex] {
            weights[vertex] = newWeight
            heap.enheap((vertex: vertex, weight: newWeight))
        }
    }
}

var dp = [Int](repeating: 0, count: n)
dp[1] = 1
func dfs(from index: Int) -> Int {
    if dp[index] == 0 {
        for (vertex, _) in edges[index] {
            if weights[vertex] < weights[index] {
                dp[index] += dfs(from: vertex)
            }
        }
    }
    return dp[index]
}
print(dfs(from: 0))
