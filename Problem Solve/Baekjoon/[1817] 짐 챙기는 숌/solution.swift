//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

final class SwiftProblemSolve {
    func getMinimumBoxes(from books: [Int], payload: Int) -> Int {
        var boxes = 1
        var sum = 0
        
        for book in books {
            sum += book
            if sum > payload {
                boxes += 1
                sum = book
            }
        }
        
        return boxes
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
if nm[0] != 0 {
    let books = readLine()!.split(separator: " ").map { Int($0)! }
    let sps = SwiftProblemSolve()
    print(sps.getMinimumBoxes(from: books, payload: nm[1]))
} else {
    print(0)
}
