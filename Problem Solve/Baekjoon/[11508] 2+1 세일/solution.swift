// 힙 버전 문제 풀이
// 힙 구현
struct Heap<T> {
    private var arr = [T]()
    private let cmp: (T, T) -> Bool
    var isEmpty: Bool { arr.isEmpty }
    
    init(arr: [T] = [T](), cmp: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.cmp = cmp
    }
    
    mutating func insert(_ newElement: T) {
        arr.append(newElement)
        var child = arr.count - 1
        var parent = (child - 1) / 2
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
            var temp = index
            if left < arr.count && cmp(arr[left], arr[temp]) {
                temp = left
            }
            if right < arr.count && cmp(arr[right], arr[temp]) {
                temp = right
            }
            if index == temp { break }
            arr.swapAt(temp, index)
            index = temp
        }
        return value
    }
}
// 알고리즘 구현
let n = Int(readLine()!)!
var heap = Heap<Int>(cmp: >)
for _ in 0..<n {
    heap.insert(Int(readLine()!)!)
}

var count = 0
var result = 0
while !heap.isEmpty {
    let cost = heap.remove()
    if count == 2 {
        count = 0
        continue
    }
    result += cost
    count += 1
}
print(result)
