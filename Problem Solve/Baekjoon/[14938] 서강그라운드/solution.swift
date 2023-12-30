struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    var isEmpty: Bool { array.isEmpty }
    
    init(array: [T] = [T](), by compare: @escaping (T, T) -> Bool) {
        self.array = array
        self.compare = compare
    }
    
    mutating func enqueue(_ newElement: T) {
        var childIndex = array.count
        var parentIndex = (childIndex - 1) / 2
        array.append(newElement)
        
        while childIndex > 0 && compare(array[childIndex], array[parentIndex]) {
            array.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating func dequeue() -> T {
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

let nmr = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, r) = (nmr[0], nmr[1], nmr[2])
let itemCounts = readLine()!.split(separator: " ").map { Int($0)! }

var map = [[(location: Int, distance: Int)]](repeating: [], count: n)
for _ in 0..<r {
    let abl = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (a, b, l) = (abl[0], abl[1], abl[2])
    
    map[a].append((location: b, distance: l + 1))
    map[b].append((location: a, distance: l + 1))
}

var result = 0
for i in 0..<n {
    var distances = [Int](repeating: Int.max, count: n)
    distances[i] = 0
    
    var heap = Heap<(location: Int, distance: Int)> { $0.distance > $1.distance }
    heap.enqueue((location: i, distance: 0))
    while !heap.isEmpty {
        let info = heap.dequeue()
        if info.distance > distances[info.location] { continue }
        
        for road in map[info.location] {
            let newDistance = road.distance + info.distance
            if newDistance < distances[road.location] {
                distances[road.location] = newDistance
                heap.enqueue((location: road.location, distance: newDistance))
            }
        }
    }
    
    var temp = 0
    for (index, distance) in distances.enumerated() where distance <= m {
        temp += itemCounts[index]
    }
    result = max(result, temp)
}
print(result)
