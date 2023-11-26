//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

let mn = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (mn[1], mn[0])
let my = [-1, 1, 0, 0]
let mx = [0, 0, -1, 1]

var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)

var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
dp[m - 1][n - 1] = 1

var map = [[Int]]()
for _ in 0..<m {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func dfs(_ location: (y: Int, x: Int)) -> Int {
    if isVisited[location.y][location.x] {
        return dp[location.y][location.x]
    }
    
    isVisited[location.y][location.x] = true
    let num = map[location.y][location.x]
    
    for i in 0..<4 {
        let newY = location.y + my[i]
        let newX = location.x + mx[i]
        
        if (0..<m).contains(newY) && (0..<n).contains(newX) && num > map[newY][newX] {
            dp[location.y][location.x] = dp[location.y][location.x] + dfs((y: newY, x: newX))
        }
    }
    
    return dp[location.y][location.x]
}
print(dfs((y: 0, x: 0)))
