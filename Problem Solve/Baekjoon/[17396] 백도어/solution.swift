import Foundation

public struct Heap<T> {
    var nodes: [T] = []
    let comparer: (T,T) -> Bool

    var isEmpty: Bool {
        return nodes.isEmpty
    }
    init(comparer: @escaping (T,T) -> Bool) {
        self.comparer = comparer
    }
    
    func top() -> T? {
        return nodes.first
    }

    mutating func push(_ element: T) {
        var index = nodes.count

        nodes.append(element)

        while index > 0, !comparer(nodes[index],nodes[(index-1)/2]) {
            nodes.swapAt(index, (index-1)/2)
            index = (index-1)/2
        }
    }

    mutating func pop() -> T? {
        guard !nodes.isEmpty else {
            return nil
        }

        if nodes.count == 1 {
            return nodes.removeFirst()
        }

        let result = nodes.first
        nodes.swapAt(0, nodes.count-1)
        _ = nodes.popLast()

        var index = 0

        while index < nodes.count {
            let left = index * 2 + 1
            let right = left + 1

            if right < nodes.count {
                if comparer(nodes[left], nodes[right]),
                    !comparer(nodes[right], nodes[index]) {
                    nodes.swapAt(right, index)
                    index = right
                } else if !comparer(nodes[left], nodes[index]){
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else if left < nodes.count {
                if !comparer(nodes[left], nodes[index]) {
                    nodes.swapAt(left, index)
                    index = left
                } else {
                    break
                }
            } else {
                break
            }
        }

        return result
    }
}

extension Heap where T: Comparable {
    init() {
        self.init(comparer: >=)
    }
}

let INF = Int.max
let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let (N, M) = (input[0], input[1])
let ward = readLine()!.split(separator: " ").map{Int(String($0))!}
var graph = [[(Int, Int)]](repeating: [(Int, Int)](), count: N)
var distance = [Int](repeating: INF, count: N)

for _ in 0..<M {
    let temp = readLine()!.split(separator: " ").map{Int(String($0))!}
    graph[temp[0]].append((temp[1], temp[2]))
    graph[temp[1]].append((temp[0], temp[2]))
}

var h = Heap<(Int, Int)>(comparer: { $0.1 >= $1.1 })
h.push((0, 0))
distance[0] = 0

while !h.isEmpty {
    let (x, dist) = h.pop()!
    
    if dist > distance[x] {
        continue
    }
    
    for (node, d) in graph[x] {
        if ward[node] == 1 && node != N - 1 {
            continue
        }
        let cost = dist + d
        if cost < distance[node] {
            h.push((node, cost))
            distance[node] = cost
        }
    }
}

print(distance.last == INF ? -1 : distance.last!)

