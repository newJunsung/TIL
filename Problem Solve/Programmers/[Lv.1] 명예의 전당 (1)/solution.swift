import Foundation

func solution(_ k:Int, _ score:[Int]) -> [Int] {
    var arr = [Int]()
    var heap = Heap<Int> { $0 < $1 }
    for s in score {
        if heap.count < k {
            heap.append(s)
        } else {
            if heap.top < s {
                heap.remove()
                heap.append(s)
            }
        }
        arr.append(heap.top)
    }
    return arr
}

struct Heap<T> {
    private var arr = [T]()
    private let cmp: (T, T) -> Bool
    
    var top: T { arr[0] }
    var count: Int { arr.count }
    var isEmpty: Bool { arr.isEmpty }
    
    public init(arr: [T] = [T](), cmp: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.cmp = cmp
    }
    
    mutating func append(_ newElement: T) {
        arr.append(newElement)
        
        var child = arr.count - 1
        var parent = (child - 1) / 2
        while child > 0, cmp(arr[child], arr[parent]) {
            arr.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    @discardableResult
    mutating func remove() -> T? {
        if arr.isEmpty { return nil }
        if arr.count == 1 { return arr.removeLast() }
        
        let value = arr[0]
        arr[0] = arr.removeLast()
        
        var i = 0
        while i < arr.count {
            let leftChild = i * 2 + 1
            let rightChild = leftChild + 1
            
            var temp = i
            if leftChild < arr.count && cmp(arr[leftChild], arr[temp]) {
                temp = leftChild
            }
            if rightChild < arr.count && cmp(arr[rightChild], arr[temp]) {
                temp = rightChild
            }
            if temp == i { break }
            arr.swapAt(i, temp)
            i = temp
        }
        return value
    }
}
