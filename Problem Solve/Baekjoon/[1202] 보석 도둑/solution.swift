struct Heap<T> {
    private var array = [T]()
    private let cmp: (T, T) -> Bool
    
    var isEmpty: Bool { array.isEmpty }
    var top: T { array[0] }
    var count: Int { array.count }
    
    init(cmp: @escaping (T, T) -> Bool) {
        self.cmp = cmp
    }
    
    mutating func enheap(_ newElement: T) {
        array.append(newElement)
        
        var child = array.count - 1
        var parent = (child - 1) / 2
        
        while child > 0 && cmp(array[child], array[parent]) {
            array.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
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
            let leftChild = index * 2 + 1
            let rightChild = leftChild + 1
            
            var target = index
            if leftChild < array.count && cmp(array[leftChild], array[target]) {
                target = leftChild
            }
            if rightChild < array.count && cmp(array[rightChild], array[target]) {
                target = rightChild
            }
            if target == index { break }
            
            array.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

var jewels = [(weight: Int, price: Int)]()
for _ in 0..<n {
    let mv = readLine()!.split(separator: " ").map { Int($0)! }
    jewels.append((weight: mv[0], price: mv[1]))
}
jewels.sort {
    if $0.weight == $1.weight {
        return $0.price < $1.price
    }
    return $0.weight < $1.weight
}

var bags = [Int]()
for _ in 0..<k {
    bags.append(Int(readLine()!)!)
}
bags.sort()

var jewelsInBag = Heap<(weight: Int, price: Int)> {
    if $0.price == $1.price {
        return $0.weight > $1.weight
    }
    return $0.price > $1.price
}
var result = 0
var index = 0

for bag in bags {
    while index < n && jewels[index].weight <= bag {
        jewelsInBag.enheap(jewels[index])
        index += 1
    }
    if !jewelsInBag.isEmpty {
        result += jewelsInBag.deheap().price
    }
}

print(result)

