//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

final class SwiftProblemSolve {
}

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
let days = readLine()!.split(separator: " ").map { Int($0)! }

var left = 1, right = 1500000000
while left < right {
    let mid = (left + right) / 2
    
    var sum = 0
    for i in 1..<n {
        let diff = days[i] - days[i - 1]
        let totalRange = mid * (mid + 1) / 2
        if mid <= diff {
            sum += totalRange
        } else {
            let remain = mid - diff
            let remainRange = remain * (remain + 1) / 2
            sum += (totalRange - remainRange)
        }
    }
    sum += mid * (mid + 1) / 2
    
    if sum < k {
        left = mid + 1
    } else {
        right = mid
    }
}

print(left)
