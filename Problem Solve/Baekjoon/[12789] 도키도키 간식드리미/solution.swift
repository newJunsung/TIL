//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

final class SwiftProblemSolve {
}

let n = Int(readLine()!)!
let studentNumbers = readLine()!.split(separator: " ").map { Int($0)! }

var snackStack = [Int]()
var verticalStack = [Int]()

for studentNumber in studentNumbers {
    if  !verticalStack.isEmpty && verticalStack.last! < studentNumber {
        while !verticalStack.isEmpty && (verticalStack.last! < studentNumber) {
            snackStack.append(verticalStack.removeLast())
        }
    }
    verticalStack.append(studentNumber)
}

while !verticalStack.isEmpty {
    snackStack.append(verticalStack.removeLast())
}

var check = true
for i in 0..<(n - 1) {
    if snackStack[i] > snackStack[i + 1] {
        check = false
        break
    }
}
print(check ? "Nice" : "Sad")
