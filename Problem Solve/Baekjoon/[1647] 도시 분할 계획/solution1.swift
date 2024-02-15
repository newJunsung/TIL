struct Heap<T> {
    private let compare: (T, T) -> Bool
    private var array = [T]()
    
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
            let leftIndex = index * 2 + 1
            let rightIndex = leftIndex + 1
            
            var target = index
            if leftIndex < array.count && compare(array[leftIndex], array[target]) {
                target = leftIndex
            }
            if rightIndex < array.count && compare(array[rightIndex], array[target]) {
                target = rightIndex
            }
            if target == index { break }
            array.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var connections = [Int](0...n)
var heap = Heap<(a: Int, b: Int, c: Int)> { $0.c < $1.c }

for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    heap.enheap((a, b, c))
}

func find(_ index: Int) -> Int {
    if connections[index] == index {
        return index
    }
    connections[index] = find(connections[index])
    return connections[index]
}

func union(_ a: Int, _ b: Int) -> Bool {
    let aP = find(a)
    let bP = find(b)
    
    if aP != bP {
        connections[bP] = aP
    }
    
    return aP != bP
}

var result = 0
var breakLine = -1
while !heap.isEmpty {
    let (a, b, c) = heap.deheap()
    if union(a, b) {
        result += c
        breakLine = max(breakLine, c)
    }
}
print(result - breakLine)
