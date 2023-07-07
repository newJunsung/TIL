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
        
        while childIndex > 0 && cmp(arr[childIndex], arr[parentIndex]) {
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
            if leftChildIndex < arr.count && cmp(arr[leftChildIndex], arr[target]) {
                target = leftChildIndex
            }
            if rightChildIndex < arr.count && cmp(arr[rightChildIndex], arr[target]) {
                target = rightChildIndex
            }
            if target == index { break }
            
            arr.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0], k = nk[1]

var graph = [Int](repeating: Int.max, count: 100_001)
graph[n] = 0

var heap = Heap<(g: Int, c: Int)> { $0.c < $1.c }
heap.append((g: n, c: 0))
while !heap.isEmpty {
    let info = heap.remove()
    if graph[info.g] < info.c { continue }

    for i in [-1, 1, info.g] {
        let temp = info.g + i
        if !(0..<graph.count).contains(temp) { continue }

        if i == info.g {
            if info.c < graph[temp] {
                graph[temp] = info.c
                heap.append((g: temp, c: info.c))
            }
        } else {
            if info.c + 1 < graph[temp] {
                graph[temp] = info.c + 1
                heap.append((g: temp, c: info.c + 1))
            }
        }
    }

}
print(graph[k])
