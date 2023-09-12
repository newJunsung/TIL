struct Heap<T> {
    private var array = [T]()
    private let cmp: (T, T) -> Bool
    
    var top: T { array[0] }
    var isEmpty: Bool { array.isEmpty }
    
    init(array: [T] = [T](), cmp: @escaping (T, T) -> Bool) {
        self.array = array
        self.cmp = cmp
    }
    
    mutating func append(_ newElement: T) {
        array.append(newElement)
        var child = array.count - 1
        var parent = (child - 1) / 2
        while child > 0 && cmp(array[child], array[parent]) {
            array.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    mutating func remove() -> T {
        if array.count == 1 {
            return array.removeLast()
        }
        let value = array[0]
        array[0] = array.removeLast()
        var index = 0
        while true {
            let leftChild = index * 2 + 1
            let rightChild = leftChild + 1
            var target = index
            if leftChild < array.count && cmp(array[leftChild], array[target]) {
                target = leftChild
            }
            if rightChild < array.count && cmp(array[rightChild], array[target]) {
                target = rightChild
            }
            if target == index { break }
            array.swapAt(target, index)
            index = target
        }
        return value
    }
}

var n = Int(readLine()!)!
var heap = Heap<(start: Int, end: Int)>() {
    if $0.start == $1.start {
        return $0.end < $1.end
    } else {
        return $0.start < $1.start
    }
}
for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    heap.append((start: info[1], end: info[2]))
}

var count = 0
var heap2 = Heap<Int>(cmp: <)
while !heap.isEmpty {
    let info = heap.remove()
    if heap2.isEmpty {
        heap2.append(info.end)
        count += 1
    } else {
        if heap2.top > info.start {
            count += 1
            heap2.append(info.end)
        } else {
            let _ = heap2.remove()
            heap2.append(info.end)
        }
    }
}
print(count)
