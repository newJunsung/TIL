//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool { input.isEmpty && output.isEmpty }
    
    init(input: [T] = [T]()) {
        self.input = input
    }
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input = [T]()
        }
        
        return output.removeLast()
    }
}


let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

var result = "<"
var count = 1
var q = Queue(input: Array(1...n))
while !q.isEmpty {
    let number = q.dequeue()

    if count == k {
        result += "\(number), "
        count = 1
    } else {
        q.enqueue(number)
        count += 1
    }
}

result.removeLast()
result.removeLast()
result += ">"
print(result)
