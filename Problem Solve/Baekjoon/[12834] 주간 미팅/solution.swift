struct Heap<T> {
    private var arr = [T]()
    private let cmp: (T, T) -> Bool
    
    var isEmpty: Bool { arr.isEmpty }
    
    init(arr: [T] = [T](), cmp: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.cmp = cmp
    }
    
    mutating func removeAll() {
        arr.removeAll()
    }
    
    mutating func append(_ newElement: T) {
        arr.append(newElement)
        var childIndex = arr.count - 1
        var parentIndex = (childIndex - 1) / 2
        
        while childIndex > 0 && cmp(arr[parentIndex], arr[childIndex]) {
            arr.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating func remove() -> T {
        if arr.count == 1 { return arr.removeLast() }
        
        let value = arr[0]
        arr[0] = arr.removeLast()
        
        var index = 0
        while index < arr.count {
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            
            var target = index
            if leftChildIndex < arr.count && cmp(arr[target], arr[leftChildIndex]) {
                target = leftChildIndex
            }
            if rightChildIndex < arr.count && cmp(arr[target], arr[rightChildIndex]) {
                target = rightChildIndex
            }
            if target == index { break }
            
            arr.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

let s = readLine()!.split(separator: " ").map { Int($0)! }
let n = s[0], v = s[1], e = s[2]
let ab = readLine()!.split(separator: " ").map { Int($0)! - 1 }
let h = readLine()!.split(separator: " ").map { Int($0)! - 1 }

var graph = [[(g: Int, d: Int)]](repeating: [], count: v)
for _ in 0..<e {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    graph[info[0] - 1].append((g: info[1] - 1, d: info[2]))
    graph[info[1] - 1].append((g: info[0] - 1, d: info[2]))
}

var distanceA = [Int](repeating: Int.max, count: v)
distanceA[ab[0]] = 0

var distanceB = [Int](repeating: Int.max, count: v)
distanceB[ab[1]] = 0

var heap = Heap<(g: Int, d: Int)> { $0.d < $1.d }
heap.append((g: ab[0], d: 0))
while !heap.isEmpty {
    let info = heap.remove()
    if info.d > distanceA[info.g] { continue }
    
    for g in graph[info.g] {
        let distance = g.d + info.d
        if distance < distanceA[g.g] {
            distanceA[g.g] = distance
            heap.append((g: g.g, d: distance))
        }
    }
}

heap.append((g: ab[1], d: 0))
while !heap.isEmpty {
    let info = heap.remove()
    if info.d > distanceB[info.g] { continue }
    
    for g in graph[info.g] {
        let distance = g.d + info.d
        if distance < distanceB[g.g] {
            distanceB[g.g] = distance
            heap.append((g: g.g, d: distance))
        }
    }
}

var sum = 0
h.forEach { num in
    let dA = distanceA[num] < Int.max ? distanceA[num] : -1
    let dB = distanceB[num] < Int.max ? distanceB[num] : -1
    
    sum = sum + dA + dB
}
print(sum)
