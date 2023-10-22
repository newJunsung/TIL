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

var dp = [(zero: Int, one: Int)](repeating: (0, 0), count: 41)
dp[0] = (1, 0)
dp[1] = (0, 1)

for i in 2...40 {
    dp[i].zero = dp[i - 1].zero + dp[i - 2].zero
    dp[i].one = dp[i - 1].one + dp[i - 2].one
}

var result = ""
for _ in 0..<Int(readLine()!)! {
    let n = dp[Int(readLine()!)!]
    result += "\(n.zero) \(n.one)\n"
}
print(result)
