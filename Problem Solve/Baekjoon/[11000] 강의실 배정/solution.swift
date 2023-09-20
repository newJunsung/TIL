struct Heap<T> {
    private var array = [T]()
    private let cmp: (T, T) -> Bool
    
    public var isEmpty: Bool { array.isEmpty }
    public var top: T { array[0] }
    
    init(array: [T] = [T](), cmp: @escaping (T, T) -> Bool) {
        self.array = array
        self.cmp = cmp
    }
    
    public mutating func append(_ newElement: T) {
        array.append(newElement)
        var childIndex = array.count - 1
        var parentIndex = (childIndex - 1) / 2
        while childIndex > 0 && cmp(array[childIndex], array[parentIndex]) {
            array.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    public mutating func remove() -> T {
        if array.count == 1 { return array.removeLast() }
        
        let value = array[0]
        array[0] = array.removeLast()
        var index = 0
        while true {
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            var target = index
            if leftChildIndex < array.count && cmp(array[leftChildIndex], array[target]) {
                target = leftChildIndex
            }
            if rightChildIndex < array.count && cmp(array[rightChildIndex], array[target]) {
                target = rightChildIndex
            }
            if index == target {
                return value
            }
            array.swapAt(index, target)
            index = target
        }
    }
}

let n = Int(readLine()!)!
var classes = Heap<(start: Int, end: Int)> {
    if $0.start == $1.start {
        return $1.end < $1.end
    } else {
        return $0.start < $1.start
    }
}
for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    classes.append((start: info[0], end: info[1]))
}

var count = 0
var endTime = Heap<Int> { $0 < $1 }
while !classes.isEmpty {
    let info = classes.remove()
    if endTime.isEmpty {
        count += 1
        endTime.append(info.end)
    } else {
        if endTime.top <= info.start {
            let _ = endTime.remove()
            endTime.append(info.end)
        } else {
            endTime.append(info.end)
            count += 1
        }
    }
}
print(count)
