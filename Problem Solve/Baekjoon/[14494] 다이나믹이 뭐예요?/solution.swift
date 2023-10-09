//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

final class SwiftProblemSolve {
    var dp = [[Int]](repeating: [Int](repeating: 1, count: 1000), count: 1000)
    
    func solve(_ n: Int, _ m: Int) -> Int {
        for y in 1..<n {
            for x in 1..<m {
                dp[y][x] = 0
                
                let prevY = y - 1
                let prevX = x - 1
                let isContainY = 0 <= prevY
                let isContainX = 0 <= prevX

                if isContainY {
                    let newCount = (dp[prevY][x] + dp[y][x]) % 1_000_000_007
                    dp[y][x] = newCount
                }
                if isContainX {
                    let newCount = (dp[y][prevX] + dp[y][x]) % 1_000_000_007
                    dp[y][x] = newCount
                }
                if isContainY && isContainX {
                    let newCount = (dp[prevY][prevX] + dp[y][x]) % 1_000_000_007
                    dp[y][x] = newCount
                }
            }
        }
        
        return dp[n - 1][m - 1]
    }
}
let nm = readLine()!.split(separator: " ").map { Int($0)! }
print(SwiftProblemSolve().solve(nm[0], nm[1]))
