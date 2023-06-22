struct Heap<T> {
    private var arr = [T]()
    private let cmp: (T, T) -> Bool
    var isEmpty: Bool { arr.isEmpty }
    
    init(arr: [T] = [T](), cmp: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.cmp = cmp
    }
    
    mutating func append(newElement: T) {
        arr.append(newElement)
        
        var child = arr.count - 1
        var parent = (child - 1) / 2
        while child > 0 && cmp(arr[child], arr[parent]) {
            arr.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    mutating func remove() -> T? {
        if arr.isEmpty { return nil }
        if arr.count == 1 { return arr.removeLast() }
        
        let value = arr[0]
        arr[0] = arr.removeLast()
        
        var i = 0
        while i < arr.count {
            let leftChild = i * 2 + 1
            let rightChild = leftChild + 1
            
            var temp = i
            if leftChild < arr.count && cmp(arr[leftChild], arr[temp]) {
                temp = leftChild
            }
            if rightChild < arr.count && cmp(arr[rightChild], arr[temp]) {
                temp = rightChild
            }
            if temp == i {
                break
            }
            
            arr.swapAt(i, temp)
            i = temp
        }
        return value
    }
}

let nd = readLine()!.split(separator: " ").map { Int($0)! }

var graph = [[(g: Int, d: Int)]](repeating: [], count: 10000 + 1)
for i in 0...nd[1] {
    graph[i].append((g: i + 1 , d: 1))
}
for _ in 0..<nd[0] {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    graph[info[0]].append((g: info[1], d: info[2]))
}

var distances = [Int](repeating: Int.max, count: 10000 + 1)
distances[0] = 0

var heap = Heap<(g: Int, d: Int)> { $0.d < $1.d }
heap.append(newElement: (g: 0, d: 0))
while !heap.isEmpty {
    let info = heap.remove()!
    if info.d > distances[info.g] { continue }
    
    for tempG in graph[info.g] {
        let d = tempG.d + info.d
        if d < distances[tempG.g] {
            distances[tempG.g] = d
            heap.append(newElement: (g: tempG.g, d: d))
        }
    }
}
print(distances[nd[1]])
