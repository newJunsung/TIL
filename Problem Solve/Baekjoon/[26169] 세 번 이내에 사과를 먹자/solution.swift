//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

final class SwiftProblemSolve {
}

var board = [[String]](repeating: [], count: 5)
for i in 0..<5 {
    board[i] = readLine()!.split(separator: " ").map { String($0) }
}

let rc = readLine()!.split(separator: " ").map { Int($0)! }
let location = (rc[0], rc[1])

let my = [-1, 1, 0, 0]
let mx = [0, 0, -1, 1]

var canEatTwoApple = false
var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: 5), count: 5)

func dfs(to location: (row: Int, col: Int), eatCount: Int, moveCount: Int) {
    var newEatCount = eatCount
    if board[location.row][location.col] == "1" {
        newEatCount += 1
    }
    
    if moveCount >= 3 {
        if newEatCount >= 2 {
            canEatTwoApple = true
        }
        return
    }
    
    for i in 0..<4 {
        let newRow = my[i] + location.row
        let newCol = mx[i] + location.col
        if (0..<5).contains(newRow) && (0..<5).contains(newCol) && board[newRow][newCol] != "-1" && !isVisited[newRow][newCol] {
            isVisited[newRow][newCol] = true
            dfs(to: (row: newRow, col: newCol), eatCount: newEatCount, moveCount: moveCount + 1)
            isVisited[newRow][newCol] = false
        }
    }
}

isVisited[location.0][location.1] = true
dfs(to: location, eatCount: 0, moveCount: 0)

print(canEatTwoApple ? 1 : 0)
