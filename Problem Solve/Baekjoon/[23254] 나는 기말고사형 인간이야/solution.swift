struct Heap<T> {
    private var arr = [T]()
    private var cmp: (T, T) -> Bool
    
    var isEmpty: Bool { arr.isEmpty }
    
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
        if arr.count == 1 {
            return arr.removeLast()
        }
        
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
            arr.swapAt(target, index)
            index = target
        }
        return value
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let aArr = readLine()!.split(separator: " ").map { Int($0)! }
let bArr = readLine()!.split(separator: " ").map { Int($0)! }

var sum = 0
var hours = nm[0] * 24

var heap = Heap<(score: Int, effi: Int)> { $0.effi > $1.effi }
var array = [(score: Int, effi: Int)]()
for i in 0..<nm[1] {
    sum += aArr[i]
    heap.append((score: aArr[i], effi: bArr[i]))
}

while !heap.isEmpty {
    if hours == 0 { break }
    let info = heap.remove()
    let leftScore = 100 - info.score
    let tempHour = leftScore / info.effi
    
    if tempHour > hours {
        sum += info.effi * hours
        hours = 0
    } else {
        sum += info.effi * tempHour
        hours -= tempHour
    }
    
    if leftScore % info.effi > 0 {
        heap.append((score: 100 - (leftScore % info.effi), effi: leftScore % info.effi))
    }
}
print(sum)
