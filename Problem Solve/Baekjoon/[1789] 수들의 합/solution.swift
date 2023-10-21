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

let s = Int64(readLine()!)!

var left: Int64 = 1
var right: Int64 = 100_000

while left <= right {
    let mid = (left + right) / 2
    let sum = mid * (mid + 1) / 2
    
    if sum <= s {
        left = mid + 1
    } else {
        right = mid - 1
    }
}
print(left - 1)
