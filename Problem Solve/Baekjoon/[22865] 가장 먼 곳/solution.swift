struct Heap<T> {
    private var arr = [T]()
    private var cmp: (T, T) -> Bool
    
    var isEmpty: Bool { arr.isEmpty }
    
    init(arr: [T] = [T](), cmp: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.cmp = cmp
    }
    
    mutating func enheap(_ newElement: T) {
        var child = arr.count
        var parent = (child - 1) / 2
        
        arr.append(newElement)
        
        while child > 0 && cmp(arr[child], arr[parent]) {
            arr.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    mutating func deheap() -> T {
        if arr.count == 1 {
            return arr.removeLast()
        }
        
        let value = arr[0]
        
        arr[0] = arr.removeLast()
        
        var index = 0
        while true {
            let leftChild = index * 2 + 1
            let rightChild = leftChild + 1
            
            var target = index
            
            if leftChild < arr.count && cmp(arr[leftChild], arr[target]) {
                target = leftChild
            }
            
            if rightChild < arr.count && cmp(arr[rightChild], arr[target]) {
                target = rightChild
            }
            
            if target == index {
                break
            }
            
            arr.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

let n = Int(readLine()!)!
let abc = readLine()!.split(separator: " ").map { Int($0)! - 1 }
let (a, b, c) = (abc[0], abc[1], abc[2])
let m = Int(readLine()!)!

var town = [[(desti: Int, length: Int)]](repeating: [], count: n)
var minimums = [[Int]]()

for _ in 0..<m {
    let del = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (d, e, l) = (del[0], del[1], del[2] + 1)
    
    town[d].append((e, l))
    town[e].append((d, l))
}

minimums.append(dijk(a))
minimums.append(dijk(b))
minimums.append(dijk(c))

func dijk(_ start: Int) -> [Int] {
    var minimum = [Int](repeating: Int.max, count: n)
    minimum[start] = 0
    
    var h = Heap<(desti: Int, length: Int)> { $0.length < $1.length }
    h.enheap((desti: start, length: 0))
    
    while !h.isEmpty {
        let info = h.deheap()
        
        if info.length > minimum[info.desti] {
            continue
        }
        
        for road in town[info.desti] {
            let newLength = info.length + road.length
            
            if newLength < minimum[road.desti] {
                minimum[road.desti] = newLength
                h.enheap((desti: road.desti, length: newLength))
            }
        }
    }
    
    return minimum
}


var result = -1
var minimum = Int.max

for i in 0..<n {
    let temp = min(minimums[0][i], minimums[1][i], minimums[2][i])
    
    if minimum < temp {
        result = (i + 1)
        minimum = temp
    }
}

print(result)

