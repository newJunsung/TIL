//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var result = 0
var leftDays = m - n - readLine()!.split(separator: " ").reduce(into: 0) { $0 += Int($1)! }
if n > 0 {
    var depression = 1
    while leftDays > 0 {
        if leftDays >= (n + 1) {
            result += (depression * depression) * (n + 1)
        } else {
            result += (depression * depression) * leftDays
        }
        leftDays -= (n + 1)
        depression += 1
    }
} else {
    for i in 1...m {
        result += i * i
    }
}
print(result)
