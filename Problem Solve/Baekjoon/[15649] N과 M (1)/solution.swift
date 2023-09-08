struct Heap<T: Comparable> {
    private var arr = [T]()
    private let cmp: (T, T) -> Bool
    var isEmpty: Bool { arr.isEmpty }
    var top: T { arr[0] }
    
    init(arr: [T] = [T](), cmp: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.cmp = cmp
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
        while true {
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
            arr.swapAt(index, target)
            index = target
        }
        return value
    }
}

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

var positions = [Heap<Int>](repeating: Heap<Int>(cmp: >), count: 11)
for _ in 0..<n {
    let pw = readLine()!.split(separator: " ").map { Int($0)! }
    positions[pw[0] - 1].append(pw[1])
}

for i in 0..<11 {
    for _ in 0..<k {
        if positions[i].isEmpty { break }
        let value = positions[i].remove()
        if value == 0 { break }
        positions[i].append(value - 1)
    }
}

var total = 0
for i in 0..<11 {
    if positions[i].isEmpty { continue }
    total += positions[i].top
}
print(total)
