typealias Info = (station: Int, cost: Int, count: Int)
struct Heap<T> {
    private var arr = [T]()
    private let cmp: (T, T) -> Bool
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

let nr = readLine()!.split(separator: " ").map { Int($0)! }
let (n, r) = (nr[0], nr[1])

var map = [[(station: Int, cost: Int)]](repeating: [], count: n)
for _ in 0..<r {
    let str = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c, d, e) = (str[0] - 1, str[1] - 1, str[2], str[3], str[4])
    var cost = c
    if e - 10 > 0 { cost += (e - 10) * d }
    map[a].append((station: b, cost: cost))
}

var dijk = [(cost: Int, count: Int)](repeating: (cost: 18_200_000, count: 1), count: n)
dijk[0] = (0, 1)

var heap = Heap<Info>{
    if $0.cost == $1.cost { return $0.count < $1.count }
    return $0.cost < $1.cost
}
heap.append((0, 0, 1))
while !heap.isEmpty {
    let info = heap.remove()
    if info.cost > dijk[info.station].cost { continue }
    else if info.cost == dijk[info.station].cost && info.count > dijk[info.station].count { continue }
    
    for m in map[info.station] {
        let tempCost = m.cost + info.cost
        if dijk[m.station].cost > tempCost {
            dijk[m.station] = (tempCost, info.count + 1)
            heap.append((m.station, tempCost, info.count + 1))
        } else if dijk[m.station].cost == tempCost && dijk[m.station].count > info.count + 1 {
            dijk[m.station].count = info.count + 1
            heap.append((m.station, tempCost, info.count + 1))
        }
    }
}
print(dijk[n - 1].cost < 18_200_000 ? "\(dijk[n - 1].cost) \(dijk[n - 1].count)" : "It is not a great way.")
