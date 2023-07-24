struct Heap<T> {
    var arr = [T]()
    private let cmp: (T, T) -> Bool
    
    var top: T { arr[0] }
    var isEmtpy: Bool { arr.isEmpty }
    var count: Int { arr.count }
    
    init(arr: [T] = [T](), cmp: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.cmp = cmp
    }
    
    mutating func append(_ newElement: T) {
        arr.append(newElement)
        var child = arr.count - 1
        var parent = (child) / 2
        while child > 0 && cmp(arr[child], arr[parent]) {
            arr.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
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
            let left = index * 2 + 1
            let right = left + 1
            var target = index
            if left < arr.count && cmp(arr[left], arr[target]) {
                target = left
            }
            if right < arr.count && cmp(arr[right], arr[target]) {
                target = right
            }
            if index == target { break }
            arr.swapAt(target, index)
            index = target
        }
        return value
    }
}

for _ in 0..<Int(readLine()!)! {
    let m = Int(readLine()!)!
    
    var bigHeap = Heap<Int>(cmp: <)
    var smallHeap = Heap<Int>(cmp: >)
    var arr = [Int]()
    for _ in 0...(m / 10) {
        arr += readLine()!.split(separator: " ").map { Int($0)! }
    }
    
    var ans = ""
    for i in 0..<m {
        if bigHeap.isEmtpy {
            bigHeap.append(arr[i])
        } else if smallHeap.isEmtpy {
            bigHeap.append(arr[i])
            smallHeap.append(bigHeap.remove())
        }
        
        if i > 1 {
            if arr[i] >= bigHeap.top {
                bigHeap.append(arr[i])
            } else if arr[i] <= smallHeap.top {
                smallHeap.append(arr[i])
            } else {
                bigHeap.append(arr[i])
            }
        }
        
        if i.isMultiple(of: 2) {
            if i != 0 && (i % 20) == 0 {
                ans += "\n"
            }
            ans += bigHeap.count > smallHeap.count ? "\(bigHeap.top) " : "\(smallHeap.top) "
        } else {
            if bigHeap.count > smallHeap.count {
                smallHeap.append(bigHeap.remove())
            } else if bigHeap.count < smallHeap.count {
                bigHeap.append(smallHeap.remove())
            }
        }
    }
    
    print(m / 2 + 1)
    print(ans)
}
