//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

let xy = readLine()!.split(separator: " ").map { Int($0)! }
let (x, y) = (xy[0], xy[1])
let oldWinRate = y * 100 / x

if oldWinRate <= 99 {
    var left = 0
    var right = x + 1
    
    while left <= right {
        let mid = (left + right) / 2
        let newWinRate = (y + mid) * 100 / (x + mid)
        
        if newWinRate > oldWinRate {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    print(left)
} else {
    print(-1)
}
