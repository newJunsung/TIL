//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

final class SwiftProblemSolve {
    var array = [[Int]](repeating: [Int](repeating: 0, count: 10_000), count: 12)
    
    func foo() {
        for i in 0..<array.count {
            for j in 1..<10_000 {
//                let num = array[i][j] + array[i][j - 1]
//                array[i][j] = num
                array[i][j] += array[i][j - 1]
            }
        }
    }
    
    func foo2() -> [Int] {
        let arr = Array(0...1_800_000)
        return arr.sorted()
    }
    
    func fooo(n: Int) {
        for i in 0..<n {
            print(i)
        }
    }
    
    func fooo2(n: Int) {
        for i in 0..<n {
            let num = i * i
            print(String(num + i))
            print(i)
            print(num)
        }
    }
    
    func fooo3(n: Int) {
        let wantedNum = Int.random(in: 0...n)
        var leading = 0
        var trailing = n + 1
        
        while leading <= trailing {
            let mid = (trailing + leading) / 2
            if mid >= wantedNum {
                leading = mid + 1
            } else {
                trailing = mid - 1
            }
        }
        print(trailing)
    }
}

struct Heap<T> {
    private var array = [T]()
    private let compare: (T, T) -> Bool
    
    var isEmpty: Bool { array.isEmpty }
    
    init(array: [T] = [T](), compare: @escaping (T, T) -> Bool) {
        self.array = array
        self.compare = compare
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
            
            array.swapAt(target, index)
            index = target
        }
        
        return value
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var graph = [[(vertex: Int, weight: Int)]](repeating: [], count: n)
for _ in 0..<m {
    let abc = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (a, b, c) = (abc[0], abc[1], abc[2] + 1)
    graph[a].append((vertex: b, weight: c))
    graph[b].append((vertex: a, weight: c))
}

let st = readLine()!.split(separator: " ").map { Int($0)! - 1 }
let (s, t) = (st[0], st[1])

var weights = [Int](repeating: Int.max, count: n)
weights[s] = 0

var heap = Heap<(vertex: Int, weight: Int)> { $0.weight < $1.weight }
heap.enheap((vertex: s, weight: 0))
while !heap.isEmpty {
    let info = heap.deheap()
    
    for edge in graph[info.vertex] {
        let newWeight = edge.weight + info.weight
        if newWeight < weights[edge.vertex] {
            weights[edge.vertex] = newWeight
            heap.enheap((vertex: edge.vertex, weight: newWeight))
        }
    }
}

print(weights[t])
