struct Heap<T> {
    var array = [T]()
    let sortFunction: (T, T) -> Bool
    
    var isEmpty: Bool { array.isEmpty }
    
    init(sortFunction: @escaping (T, T) -> Bool) {
        self.sortFunction = sortFunction
    }
    
    mutating func insert(_ newElement: T) {
        array.append(newElement)
        
        var childIndex = array.count - 1
        var parentIndex = (childIndex - 1) / 2
        while childIndex > 0 && sortFunction(array[childIndex], array[parentIndex]) {
            array.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
    }
    
    mutating func remove() -> T? {
        if array.isEmpty { return nil }
        if array.count == 1 { return array.removeLast() }
        
        let value = array[0]
        array[0] = array.removeLast()
        
        var index = 0
        while true {
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            
            var target = index
            if leftChildIndex < array.count && sortFunction(array[leftChildIndex], array[target]) {
                target = leftChildIndex
            }
            if rightChildIndex < array.count && sortFunction(array[rightChildIndex], array[target]) {
                target = rightChildIndex
            }
            if target == index {
                 break
            }
            
            array.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

let tc = Int(readLine()!)!
var answer = ""
for _ in 0..<tc {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, d, c) = (info[0], info[1], info[2] - 1)
    
    var dependencies = [[(computer: Int, spend: Int)]](repeating: [], count: n)
    for _ in 0..<d {
        let abs = readLine()!.split(separator: " ").map { Int(String($0))! }
        dependencies[abs[1] - 1].append((computer: abs[0] - 1, spend: abs[2]))
    }
    
    var spends = [Int](repeating: Int.max, count: n)
    spends[c] = 0
    
    var heap = Heap<(computer: Int, spend: Int)> { $0.spend < $1.spend }
    var dependency = (computer: c, spend: 0)
    heap.insert(dependency)
    while !heap.isEmpty {
        dependency = heap.remove()!
        if spends[dependency.computer] < dependency.spend {
            continue
        }
        
        for d in dependencies[dependency.computer] {
            let tempSpend = dependency.spend + d.spend
            if tempSpend < spends[d.computer] {
                spends[d.computer] = tempSpend
                heap.insert((computer: d.computer, spend: tempSpend))
            }
        }
    }
    
    var count = 0
    var time = 0
    for s in spends {
        if s != Int.max {
            count += 1
            time = max(time, s)
        }
    }
    answer += "\(count) \(time)\n"
}

print(answer)
