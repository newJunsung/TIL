struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    public var isEmpty: Bool { array.isEmpty }
    public var top: T { array[0] }
    
    init(array: [T] = [T](), compare: @escaping (T, T) -> Bool) {
        self.array = array
        self.compare = compare
    }
    
    mutating func append(_ newElement: T) {
        array.append(newElement)
        var childIndex = array.count - 1
        var parentIndex = (childIndex - 1) / 2
        while childIndex > 0 && compare(array[childIndex], array[parentIndex]) {
            array.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
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
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            var target = index
            if leftChildIndex < array.count && compare(array[leftChildIndex], array[target]) {
                target = leftChildIndex
            }
            if rightChildIndex < array.count && compare(array[rightChildIndex], array[target]) {
                target = rightChildIndex
            }
            if target == index { break }
            array.swapAt(index, target)
            index = target
        }
        return value
    }
}

let n = Int(readLine()!)!

var heap = Heap<(deadLine: Int, ramen: Int)> {
    if $0.deadLine == $1.deadLine {
        return $0.ramen > $1.ramen
    } else {
        return $0.deadLine < $1.deadLine
    }
}
for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    heap.append((deadLine: info[0], ramen: info[1]))
}

var heap2 = Heap<(deadLine: Int, ramen: Int)> {
    if $0.ramen == $1.ramen {
        return $0.deadLine < $1.deadLine
    } else {
        return $0.ramen < $1.ramen
    }
}

var result = 0
var day = 1
while !heap.isEmpty {
    let info = heap.remove()
    if heap2.isEmpty {
        heap2.append(info)
        result += info.ramen
        day += 1
        continue
    }
    
    if info.deadLine < day {
        if info.deadLine >= heap2.top.deadLine && info.ramen > heap2.top.ramen {
            let temp = heap2.remove()
            heap2.append(info)
            result += info.ramen
            result -= temp.ramen
        }
    } else {
        heap2.append(info)
        result += info.ramen
        day += 1
    }
}
print(result)
