import Foundation

struct Heap<T> {
    private var array = [T]()
    let compare: (T, T) -> Bool
    
    var isEmpty: Bool { array.isEmpty }
    
    init(array: [T] = [T](), compare: @escaping (T, T) -> Bool) {
        self.array = array
        self.compare = compare
    }
    
    mutating func enheap(_ newElement: T) {
        array.append(newElement)
        
        var childIndex = array.count - 1
        var parentIndex = (childIndex - 1) / 2
        
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
            
            array.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

let nw = readLine()!.split(separator: " ").map { Int($0)! }
let (n, w) = (nw[0], nw[1])
let m = Double(readLine()!)!

var locations = [(x: Double, y: Double)]()
for _ in 0..<n {
    let xy = readLine()!.split(separator: " ").map { Double($0)! }
    locations.append((x: xy[0], y: xy[1]))
}

var lengths = [[(to: Int, length: Double)]](repeating: [], count: n)
for i in 0..<(n - 1) {
    for j in i..<n {
        let x = abs(locations[i].x - locations[j].x)
        let y = abs(locations[i].y - locations[j].y)
        let length = sqrt(x * x + y * y)
        
        if length <= m {
            lengths[i].append((to: j, length: length))
            lengths[j].append((to: i, length: length))
        }
    }
}

for _ in 0..<w {
    let connection = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    lengths[connection[0]].append((to: connection[1], length: 0))
    lengths[connection[1]].append((to: connection[0], length: 0))
}

var connections = [Double](repeating: Double.infinity, count: n)
connections[0] = 0

var heap = Heap<(index: Int, length: Double)> { $0.length < $1.length }
heap.enheap((index: 0, length: 0))

while !heap.isEmpty {
    let info = heap.deheap()
    if connections[info.index] < info.length { continue }
    
    for next in lengths[info.index] {
        let newLength = info.length + next.length
        if connections[next.to] > newLength {
            connections[next.to] = newLength
            heap.enheap((index: next.to, length: newLength))
        }
    }
}

print(Int(connections[n - 1] * 1000))

