//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

final class SwiftProblemSolve {}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let(n, m) = (nm[0], nm[1])
let k = Int(readLine()!)!

var map = [[UInt64]](repeating: [UInt64](repeating: 0, count: m + 1), count: n + 1)
map[0][0] = 1

var isConstruction = [[[Bool]]](repeating: [[Bool]](repeating: [true, true], count: m + 1), count: n + 1)
for _ in 0..<k {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    
    let bigY = info[0] >= info[2] ? info[0] : info[2]
    let smallY = bigY == info[2] ? info[0] : info[2]
    let bigX = info[1] >= info[3] ? info[1] : info[3]
    
    if bigY == smallY {
        isConstruction[bigY][bigX][0] = false
    } else {
        isConstruction[bigY][bigX][1] = false
    }
}

for y in 1...n {
    var count: UInt64 = 0
    
    if isConstruction[y][0][1] {
        count += map[y - 1][0]
    }
    
    map[y][0] = count
}

for x in 1...m {
    var count: UInt64 = 0
    
    if isConstruction[0][x][0] {
        count += map[0][x - 1]
    }
    
    map[0][x] = count
}

for y in 1...n {
    for x in 1...m {
        var count: UInt64 = 0
        
        if isConstruction[y][x][0] {
            count += map[y][x - 1]
        }
        
        if isConstruction[y][x][1] {
            count += map[y - 1][x]
        }
        
        map[y][x] = count
    }
}
print(map[n][m])
