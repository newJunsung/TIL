//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

let kn = readLine()!.split(separator: " ").map { Int($0)! }
let (k, n) = (kn[0], kn[1])

var lanseons = [Int]()
for _ in 0..<k {
    lanseons.append(Int(readLine()!)!)
}

var length = 0
var left = 0
var right = 1 << 31 - 1
while left <= right {
    let mid = (left + right) / 2
    let count = lanseons.reduce(into: 0) { $0 += $1 / mid }
    
    if count < n {
        right = mid - 1
    } else {
        left = mid + 1
    }
}
print(right)
