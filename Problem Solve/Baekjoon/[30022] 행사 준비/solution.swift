//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

final class SwiftProblemSolve {
//    var array = [[Int]](repeating: [Int](repeating: 0, count: 10_000), count: 12)
//    
//    func foo() {
//        for i in 0..<array.count {
//            for j in 1..<10_000 {
////                let num = array[i][j] + array[i][j - 1]
////                array[i][j] = num
//                array[i][j] += array[i][j - 1]
//            }
//        }
//    }
}

let nab = readLine()!.split(separator: " ").map { Int($0)! }
let (n, a, b) = (nab[0], nab[1], nab[2])

var sum = 0
var diff = [Int]()

for _ in 0..<n {
    let prices = readLine()!.split(separator: " ").map { Int($0)! }
    sum += prices[1]
    diff.append(prices[0] - prices[1])
}
diff.sort(by: <)

for i in 0..<a {
    sum += diff[i]
}
print(sum)
