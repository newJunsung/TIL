struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    var isEmpty: Bool { array.isEmpty }
    
    init(_ array: [T] = [T](), by compare: @escaping (T, T) -> Bool) {
        self.array = array
        self.compare = compare
    }
    
    mutating func enheap(_ newElement: T) {
        var childIndex = array.count
        var parentIndex = (childIndex - 1) / 2
        array.append(newElement)
        
        while childIndex > 0 && compare(array[childIndex], array[parentIndex]) {
            array.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
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
            let leftChildIndex = index * 2 + 1
            let rightChildIndex = leftChildIndex + 1
            
            var target = index
            if leftChildIndex < array.count && compare(array[leftChildIndex], array[target]) {
                target = leftChildIndex
            }
            if rightChildIndex < array.count && compare(array[rightChildIndex], array[target]) {
                target = rightChildIndex
            }
            if target == index { break }
            
            array.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

var result = ""
for _ in 0..<Int(readLine()!)! {
    let nmt = readLine()!.split(separator: " ").map { Int($0)! }
    let sgh = readLine()!.split(separator: " ").map { Int($0)! }
    
    let (n, m, t) = (nmt[0], nmt[1], nmt[2])
    let (s, g, h) = (sgh[0], sgh[1], sgh[2])
    
    var roads = [[(cross: Int, distance: Int)]](repeating: [], count: n + 1)
    for _ in 0..<m {
        let abd = readLine()!.split(separator: " ").map { Int($0)! }
        let (a, b, d) = (abd[0], abd[1], abd[2])
        
        roads[a].append((cross: b, distance: d))
        roads[b].append((cross: a, distance: d))
    }
    
    var candidates = [Int]()
    for _ in 0..<t {
        candidates.append(Int(readLine()!)!)
    }
    
    func dijkstra(from start: Int) -> [Int] {
        var distances = [Int](repeating: Int.max, count: n + 1)
        distances[start] = 0
        
        var heap = Heap<(cross: Int, distance: Int)> { $0.distance < $1.distance }
        heap.enheap((cross: start, distance: 0))
        
        while !heap.isEmpty {
            let info = heap.deheap()
            if info.distance > distances[info.cross] {
                continue
            }
            
            for temp in roads[info.cross] {
                let newDistance = info.distance + temp.distance
                if distances[temp.cross] > newDistance {
                    distances[temp.cross] = newDistance
                    heap.enheap((cross: temp.cross, distance: newDistance))
                }
            }
        }
        
        return distances
    }
    
    let distancesFromS = dijkstra(from: s)
    let distancesFromG = dijkstra(from: g)
    let distancesFromH = dijkstra(from: h)
    
    var destinations = [Int]()
    for c in candidates where distancesFromS[c] != Int.max {
        var sghc = Int.max
        if distancesFromS[g] != Int.max && distancesFromG[h] != Int.max && distancesFromH[c] != Int.max {
            sghc = distancesFromS[g] + distancesFromG[h] + distancesFromH[c]
        }
        
        var shgc = Int.max
        if distancesFromS[h] != Int.max && distancesFromH[g] != Int.max && distancesFromG[c] != Int.max {
            shgc = distancesFromS[h] + distancesFromH[g] + distancesFromG[c]
        }

        if distancesFromS[c] == sghc || distancesFromS[c] == shgc {
            destinations.append(c)
        }
    }
    result += "\(destinations.sorted().map { String($0) }.joined(separator: " "))\n"
}
print(result)

