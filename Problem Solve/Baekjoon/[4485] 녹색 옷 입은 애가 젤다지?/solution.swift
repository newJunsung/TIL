struct Heap<T> {
    private var array = [T]()
    private let sortFucntion: (T, T) -> Bool
    
    var isEmpty: Bool { array.isEmpty }
    
    init(sortFucntion: @escaping (T, T) -> Bool) {
        self.sortFucntion = sortFucntion
    }
    
    mutating func insert(_ newElement: T) {
        array.append(newElement)
        
        var childIndex = array.count - 1
        var parentIndex = (childIndex - 1) / 2
        while childIndex > 0 && sortFucntion(array[childIndex], array[parentIndex]) {
            array.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating func remove() -> T? {
        if array.isEmpty { return nil }
        if array.count == 1 { return array.removeLast() }
        
        let value = array[0]
        array[0] = array.removeLast()
        
        var index = 0
        while true {
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            
            var target = index
            if leftChildIndex < array.count && sortFucntion(array[leftChildIndex], array[target]) {
                target = leftChildIndex
            }
            if rightChildIndex < array.count && sortFucntion(array[rightChildIndex], array[target]) {
                target = rightChildIndex
            }
            
            if target == index { break }
            array.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

typealias Location = (y: Int, x: Int)

var tc = 1
let y = [-1, 1, 0 ,0]
let x = [0, 0, -1, 1]

while true {
    let n = Int(readLine()!)!
    if n == 0 { break }
    
    var graph = [[Int]](repeating: [], count: n)
    for i in 0..<n {
        graph[i] = readLine()!.split(separator: " ").map { Int(String($0))! }
    }
    
    let start = Location(0, 0)
    
    var charges = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
    charges[start.y][start.x] = graph[start.y][start.x]
    
    var heap = Heap<(Location, charge: Int)> { $0.charge < $1.charge }
    heap.insert((start, charge: graph[start.y][start.x]))
    while !heap.isEmpty {
        let info = heap.remove()!
        if charges[info.0.y][info.0.x] < info.charge { continue }
        
        for i in 0..<4 {
            let tempY = info.0.y + y[i]
            let tempX = info.0.x + x[i]
            
            if (0..<n).contains(tempY) && (0..<n).contains(tempX) {
                let tempCharge = info.charge + graph[tempY][tempX]
                if tempCharge < charges[tempY][tempX] {
                    charges[tempY][tempX] = tempCharge
                    heap.insert(((y: tempY, x: tempX), charge: tempCharge))
                }
            }
        }
    }
    
    print("Problem \(tc): \(charges[n - 1][n - 1])")
    tc += 1
}
