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
}

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    var isEmpty: Bool { input.isEmpty && output.isEmpty }
    
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

typealias PlayerInfo = (hp: Int, umbrella: Int, y: Int, x: Int, count: Int)

let nhd = readLine()!.split(separator: " ").map { Int($0)! }
let (n, h, d) = (nhd[0], nhd[1], nhd[2])
let range = (0..<n)
let my = [-1, 1, 0, 0]
let mx = [0, 0, -1, 1]

var playerInfo = (hp: h, umbrella: 0, y: 0, x: 0, count: 0)
var map = [[String]]()
for y in 0..<n {
    var x = 0
    let info = readLine()!.map { char -> String in
        let str = String(char)
        if str == "S" {
            playerInfo.y = y
            playerInfo.x = x
        }
        x += 1
        return str
    }
    map.append(info)
}

var result = 1000000000
var isArrive = false
var isVisited = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
isVisited[playerInfo.y][playerInfo.x] = h

var q = Queue<PlayerInfo>()
q.enqueue(playerInfo)
while !q.isEmpty {
    let tempInfo = q.dequeue()
    
    for i in 0..<4 {
        let newY = tempInfo.y + my[i]
        let newX = tempInfo.x + mx[i]
        
        if range.contains(newY) && range.contains(newX) {
            var newInfo = PlayerInfo(tempInfo.hp, tempInfo.umbrella, newY, newX, tempInfo.count + 1)
            if map[newY][newX] == "." {
                if newInfo.umbrella > 0 {
                    newInfo.umbrella -= 1
                } else {
                    newInfo.hp -= 1
                }
            }
            
            if map[newY][newX] == "U" {
                newInfo.umbrella = d - 1
            }
            
            if map[newY][newX] == "E" {
                isArrive = true
                break
            }
            
            if newInfo.hp > 0 && isVisited[newY][newX] < newInfo.hp {
                isVisited[newY][newX] = newInfo.hp
                q.enqueue(newInfo)
            }
        }
    }
    
    if isArrive {
        result = min(tempInfo.count + 1, result)
        break
    }
}

print(result == 1000000000 ? -1 : result)
