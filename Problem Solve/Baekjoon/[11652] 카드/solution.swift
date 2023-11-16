//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

var cards = [Int: Int]()
var result = (number: Int.max, count: 0)

let n = Int(readLine()!)!
for _ in 0..<n {
    let number = Int(readLine()!)!

    if let _ = cards[number] {
        cards[number]! += 1
    } else {
        cards[number] = 1
        if result.count == 0 {
            result = (number, 1)
        }
    }

    if result.count < cards[number]! {
        result = (number, cards[number]!)
    } else if result.count == cards[number]! {
        result.number = min(number, result.number)
    }
}
print(result.number)
