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

let n = Int(readLine()!)!

var map = [[Int]]()
for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
isVisited[0][0] = true

var canArrive = false
func dfs(_ y: Int, _ x: Int) {
    if y == (n - 1) && x == (n - 1) {
        canArrive = true
        return
    }
    
    let move = map[y][x]
    let newY = y + move
    let newX = x + move
    
    if (0..<n).contains(newY) && !isVisited[newY][x] {
        isVisited[newY][x] = true
        dfs(newY, x)
    }
    
    if (0..<n).contains(newX) && !isVisited[y][newX] {
        isVisited[y][newX] = true
        dfs(y, newX)
    }
}
dfs(0, 0)
print(canArrive ? "HaruHaru" : "Hing")
