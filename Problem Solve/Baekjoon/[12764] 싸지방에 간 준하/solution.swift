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
    public var top: T { array[0] }
    
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

typealias UsingTime = (start: Int, end: Int)
let n = Int(readLine()!)!

var waitingArray = [UsingTime]()
for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    waitingArray.append((start: info[0], end: info[1]))
}
waitingArray.sort { $0.start < $1.start }

var computerSeatCounts = [Int]()
var usableComputerNumber = Heap<Int>(compare: <)
var usingHeap = Heap<(computerNumber: Int, usingTime: UsingTime)> {
    if $0.usingTime.end == $1.usingTime.end {
        return $0.computerNumber < $1.computerNumber
    } else  {
        return $0.usingTime.end < $1.usingTime.end
    }
}
for info in waitingArray {
    while !usingHeap.isEmpty && info.start > usingHeap.top.usingTime.end {
        usableComputerNumber.enheap(usingHeap.deheap().computerNumber)
    }
    
    if usableComputerNumber.isEmpty {
        usingHeap.enheap((computerNumber: computerSeatCounts.count, usingTime: info))
        computerSeatCounts.append(1)
    } else {
        let seatNumber = usableComputerNumber.deheap()
        usingHeap.enheap((computerNumber: seatNumber, usingTime: info))
        computerSeatCounts[seatNumber] += 1
    }
}
var result = "\(computerSeatCounts.count)\n"
result += "\(computerSeatCounts.map { String($0) }.joined(separator: " "))"
print(result)
