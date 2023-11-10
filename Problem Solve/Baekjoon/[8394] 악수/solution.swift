//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

var dp = [Int](repeating: 0, count: 10_000_001)
dp[1] = 1
dp[2] = 2
for i in 3...10_000_000 {
    dp[i] = (dp[i - 1] + dp[i - 2]) % 10
}
print(dp[Int(readLine()!)!])
