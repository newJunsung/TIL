//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

final class SwiftProblemSolve {
}

struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    public var isEmpty: Bool { array.isEmpty }
    
    
    init(array: [T] = [T](), compare: @escaping (T, T) -> Bool) {
        self.array = array
        self.compare = compare
    }
    
    mutating func removeAll() {
        array.removeAll()
    }
    
    mutating func enheap(_ newElement: T) {
        array.append(newElement)
        var childIndex = array.count - 1
        var parentIndex = (childIndex - 1) / 2
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
            
            if target == index {
                break
            }
            
            array.swapAt(index, target)
            index = target
        }
        
        return value
    }
}

let nmx = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, x) = (nmx[0], nmx[1], nmx[2] - 1)

var roads = [[(town: Int, time: Int)]](repeating: [], count: n)
for _ in 0..<m {
    let info = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    roads[info[0]].append((town: info[1], time: info[2] + 1))
}

var townSpendTimes = [Int](repeating: 100_000_000, count: n)
townSpendTimes[x] = 0

var heap = Heap<(town: Int, time: Int)> { $0.time < $1.time }
heap.enheap((town: x, time: 0))

while !heap.isEmpty {
    let info = heap.deheap()
    if townSpendTimes[info.town] < info.time {
        continue
    }
    
    for road in roads[info.town] {
        let newSpendTime = road.time + info.time
        if newSpendTime < townSpendTimes[road.town] {
            townSpendTimes[road.town] = newSpendTime
            heap.enheap((town: road.town, time: newSpendTime))
        }
    }
}

func dijkstra(from studentTown: Int) -> Int {
    var tempSpendTimes = [Int](repeating: 100_000_000, count: n)
    tempSpendTimes[studentTown] = 0
    
    heap.removeAll()
    heap.enheap((town: studentTown, time: 0))
    
    while !heap.isEmpty {
        let info = heap.deheap()
        if tempSpendTimes[info.town] < info.time {
            continue
        }
        
        for road in roads[info.town] {
            let newSpendTime = info.time + road.time
            if newSpendTime < tempSpendTimes[road.town] {
                tempSpendTimes[road.town] = newSpendTime
                heap.enheap((town: road.town, time: newSpendTime))
            }
        }
    }
    
    return tempSpendTimes[x]
}

for townNumber in 0..<n where townNumber != x {
    let townSpendTime = townSpendTimes[townNumber] + dijkstra(from: townNumber)
    townSpendTimes[townNumber] = townSpendTime
}
print(townSpendTimes.max()!)
