//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

final class SwiftProblemSolve {}

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    var isEmpty: Bool { input.isEmpty && output.isEmpty }
    
    init(input: [T] = [T](), output: [T] = [T]()) {
        self.input = input
        self.output = output
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

let my = [-1, 1, 0, 0]
let mx = [0, 0, -1, 1]
let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
let nm = n * m

var virusLocation = [(y: Int, x: Int)]()
var lab = [[Int]]()
var maxSpace = 0

for y in 0..<n {
    var x = 0
    lab.append(
        readLine()!
            .split(separator: " ")
            .map { char -> Int in
                let number = Int(char)!
                if number == 2 {
                    virusLocation.append((y: y, x: x))
                }
                x += 1
                return number
            }
    )
}

func bfs(lab: [[Int]], virusLocation: [(y: Int, x: Int)]) -> Int {
    var tempLab = lab
    var queue = Queue(input: virusLocation)
    
    while !queue.isEmpty {
        let info = queue.dequeue()
        
        for i in 0..<4 {
            let newY = info.y + my[i]
            let newX = info.x + mx[i]
            
            if (0..<n).contains(newY) && (0..<m).contains(newX) && tempLab[newY][newX] == 0 {
                tempLab[newY][newX] = 2
                queue.enqueue((y: newY, x: newX))
            }
        }
    }
    
    var count = 0
    for y in 0..<n {
        for x in 0..<m {
            if tempLab[y][x] == 0 {
                count += 1
            }
        }
    }
    return count
}

func backTracking(location: Int, wallCount: Int) {
    if wallCount == 3 {
        maxSpace = max(maxSpace, bfs(lab: lab, virusLocation: virusLocation))
        return
    }
    
    for temp in location..<nm {
        let y = temp / m
        let x = temp % m
        if lab[y][x] == 0 {
            lab[y][x] = 1
            backTracking(location: temp, wallCount: wallCount + 1)
            lab[y][x] = 0
        }
    }
}

backTracking(location: 0, wallCount: 0)
print(maxSpace)
