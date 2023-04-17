struct Heap<T> {
    private var array = [T]()
    private let sortFucntion: (T, T) -> Bool
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
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
    
    mutating func remove() -> T! {
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

typealias Info = (destination: Int, charge: Int)

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph = [[Info]](repeating: [], count: n)
for _ in 0..<m {
    let info = readLine()!.split(separator: " ").map { Int(String($0))! }
    graph[info[0] - 1].append((destination: info[1] - 1, charge: info[2]))
}

let cities = readLine()!.split(separator: " ").map { Int(String($0))! }
let (start, end) = (cities[0] - 1, cities[1] - 1)

var charges = [Int](repeating: Int.max, count: n)
charges[start] = 0

var heap = Heap<Info> { $0.charge < $1.charge }
heap.insert((destination: start, charge: 0))
while !heap.isEmpty {
    let info = heap.remove()!
    
    if charges[info.destination] < info.charge { continue }
    
    for g in graph[info.destination] {
        let charge = info.charge + g.charge
        if charge < charges[g.destination] {
            charges[g.destination] = charge
            heap.insert((destination: g.destination, charge: charge))
        }
    }
}

print(charges[end])
