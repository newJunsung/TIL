struct Heap<T> {
    private var arr = [T]()
    private let sortFunction: (T, T) -> Bool
    var isEmpty: Bool { arr.isEmpty }
    var top: T? { arr[0] }
    
    init(arr: [T] = [T](), sortFunction: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.sortFunction = sortFunction
    }
    
    mutating func insert(_ newElement: T) {
        arr.append(newElement)
        
        var childIndex = arr.count - 1
        var parentIndex = (childIndex - 1) / 2
        while childIndex > 0 && sortFunction(arr[childIndex], arr[parentIndex]) {
            arr.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    @discardableResult
    mutating func remove() -> T? {
        if arr.isEmpty { return nil }
        if arr.count == 1 { return arr.removeLast() }
        
        let value = arr[0]
        arr[0] = arr.removeLast()
        
        var index = 0
        while true {
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            
            var target = index
            if leftChildIndex < arr.count && sortFunction(arr[leftChildIndex], arr[target]) {
                target = leftChildIndex
            }
            if rightChildIndex < arr.count && sortFunction(arr[rightChildIndex], arr[target]) {
                target = rightChildIndex
            }
            if target == index { break }
            
            arr.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

let nx = readLine()!.split(separator: " ").map { Int($0)! }
let n = nx[0]
var x = nx[1] - n * 1000

var amount = 0
var heap = Heap<(food: Int, price: Int)> { $0.food > $1.food }
for _ in 0..<n {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    heap.insert((food: ab[0] - ab[1], price: 4000))
    amount += ab[1]
}

while !heap.isEmpty {
    let info = heap.remove()!
    if info.food > 0 && x >= 4000 {
        x -= 4000
        amount += info.food
    }
}
print(amount)
