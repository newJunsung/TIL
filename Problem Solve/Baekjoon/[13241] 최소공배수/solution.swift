//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

// 13241
let ab = readLine()!.split(separator: " ").map { Int64($0)! }
let (a, b) = (ab[0], ab[1])

func gcd(_ a: Int64, _ b: Int64) -> Int64 {
    if b == 0 {
        return a
    }
    return gcd(b, a % b)
}

if a > b {
    print(a * b / gcd(a, b))
} else {
    print(a * b / gcd(b, a))
}
