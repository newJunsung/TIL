//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

final class SwiftProblemSolve {
}

let MOD = 1_000_000_007
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var dp = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var glasses = [[Int]](repeating: [], count: n)
for i in 0..<n {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    glasses[i] = info
    if i == 0 {
        dp[i] = info
    }
}

var result = 0
for y in 0..<n {
    for x in 0..<m where (y - 1) >= 0 && glasses[y][x] == 1 {
        var newCount = dp[y][x] + dp[y - 1][x] % MOD
        
        if x + 1 < m {
            newCount += dp[y - 1][x + 1] % MOD
        }
        
        if x - 1 >= 0 {
            newCount += dp[y - 1][x - 1] % MOD
        }
        
        dp[y][x] = newCount
        if y == (n - 1) {
            result += newCount
        }
    }
}
print(result)
