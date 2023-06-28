struct Heap<T> {
    private var arr = [T]()
    private let cmp: (T, T) -> Bool
    
    var isEmpty: Bool { arr.isEmpty }
    
    init(arr: [T] = [T](), cmp: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.cmp = cmp
    }
    
    mutating func append(_ newElement: T) {
        arr.append(newElement)
        var childIndex = arr.count - 1
        var parentIndex = (childIndex - 1) / 2
        
        while childIndex > 0 && cmp(arr[parentIndex], arr[childIndex]) {
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
            arr.swapAt(parentIndex, childIndex)
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

let my = [-1, 1, 0, 0]
let mx = [0, 0, -1, 1]
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let m = nm[0] - 1, n = nm[1] - 1

var graph = [[Int]](repeating: [], count: nm[1])
for i in 0..<nm[1] {
    graph[i] = readLine()!.map { Int(String($0))! }
}

var wall = [[Int]](repeating: [Int](repeating: Int.max, count: nm[0]), count: nm[1])
wall[0][0] = 0

var heap = Heap<(y: Int, x: Int, count: Int)> { $0.count < $1.count }
heap.append((y: 0, x: 0, count: 0))
while !heap.isEmpty {
    let info = heap.remove()
    if info.count > wall[info.y][info.x] { continue }
    
    for i in 0..<4 {
        let ty = info.y + my[i]
        let tx = info.x + mx[i]
        
        if (0...n).contains(ty) && (0...m).contains(tx) {
            let tempCount = graph[ty][tx] == 1 ? info.count + 1 : info.count
            if tempCount < wall[ty][tx] {
                wall[ty][tx] = tempCount
                heap.append((y: ty, x: tx, count: tempCount))
            }
        }
    }
}
print(wall[n][m])
