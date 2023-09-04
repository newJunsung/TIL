struct Heap<T> {
    private var arr = [T]()
    private let cmp: (T, T) -> Bool
    public var isEmpty: Bool { arr.isEmpty }
    
    init(arr: [T] = [T](), cmp: @escaping (T, T) -> Bool) {
        self.arr = arr
        self.cmp = cmp
    }
    
    public mutating func enqueue(_ newElement: T) {
        arr.append(newElement)
        var childIndex = arr.count - 1
        var parentIndex = (childIndex - 1) / 2
        while childIndex > 0 && cmp(arr[childIndex], arr[parentIndex]) {
            arr.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    public mutating func dequeue() -> T {
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
            arr.swapAt(target, index)
            index = target
        }
        return value
    }
}

let nmtd = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, t, d) = (nmtd[0], nmtd[1], nmtd[2], nmtd[3])

var mountain = [[Int]]()
for _ in 0..<n {
    let info = readLine()!.map { char -> Int in
        let num = Int(char.asciiValue!)
        if (65...90).contains(num) {
            return num - 65
        } else {
            return num - 71
        }
    }
    mountain.append(info)
}

var times = [[Int]](repeating: [Int](repeating: 1<<29, count: m), count: n)
times[0][0] = 0

let my = [-1, 1, 0, 0]
let mx = [0, 0, -1, 1]
var heap = Heap<(y: Int, x: Int, time: Int)>{ $0.time < $1.time }
heap.enqueue((y: 0, x: 0, time: 0))
while !heap.isEmpty {
    let info = heap.dequeue()
    if info.time > times[info.y][info.x] { continue }
    for i in 0..<4 {
        let newY = info.y + my[i]
        let newX = info.x + mx[i]
        if (0..<n).contains(newY) && (0..<m).contains(newX) {
            let diff = mountain[newY][newX] - mountain[info.y][info.x]
            if diff <= t {
                let newTime = diff <= 0 ? info.time + 1 : info.time + diff * diff
                if newTime < times[newY][newX] {
                    times[newY][newX] = newTime
                    heap.enqueue((y: newY, x: newX, time: newTime))
                }
            }
        }
    }
}

var times2 = [[Int]](repeating: [Int](repeating: 1<<29, count: m), count: n)
times2[0][0] = 0
heap.enqueue((y: 0, x: 0, time: 0))
while !heap.isEmpty {
    let info = heap.dequeue()
    if info.time > times2[info.y][info.x] { continue }
    for i in 0..<4 {
        let newY = info.y + my[i]
        let newX = info.x + mx[i]
        if (0..<n).contains(newY) && (0..<m).contains(newX) {
            let diff = mountain[newY][newX] - mountain[info.y][info.x]
            if abs(diff) <= t {
                let newTime = diff < 0 ? info.time + diff * diff : info.time + 1
                if newTime < times2[newY][newX] {
                    times2[newY][newX] = newTime
                    heap.enqueue((y: newY, x: newX, time: newTime))
                }
            }
        }
    }
}

var result = mountain[0][0]
for i in 0..<n {
    for j in 0..<m {
        if times[i][j] + times2[i][j] <= d {
            result = max(result, mountain[i][j])
        }
    }
}
print(result)
