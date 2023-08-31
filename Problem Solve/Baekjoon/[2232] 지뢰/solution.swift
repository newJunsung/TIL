struct Heap<T> {
    private var arr = [T]()
    private let cmp: (T, T) -> Bool
    public var isEmpty: Bool { arr.isEmpty }
    
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

let n = Int(readLine()!)!

var isBoom = [Bool](repeating: false, count: n)
var mines = [Int]()
var sortHeap = Heap<(index: Int, power: Int)> { $0.power > $1.power }
for i in 0..<n {
    let p = Int(readLine()!)!
    mines.append(p)
    sortHeap.append((index: i, power: p))
}

var result = [Int]()
while !sortHeap.isEmpty {
    let mine = sortHeap.remove()
    if isBoom[mine.index] { continue }
    isBoom[mine.index] = true
    result.append(mine.index + 1)
    
    var left = mine.index - 1
    while left >= 0 && mines[left] < mines[left + 1] && !isBoom[left] {
        isBoom[left] = true
        left -= 1
    }
    
    var right = mine.index + 1
    while right < n && mines[right] < mines[right - 1] && !isBoom[right] {
        isBoom[right] = true
        right += 1
    }
}
print(result.sorted().map { String($0) }.joined(separator: "\n"))
