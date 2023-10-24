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
    
    func foo2() -> [Int] {
        let arr = Array(0...1_800_000)
        return arr.sorted()
    }
    
    func fooo(n: Int) {
        for i in 0..<n {
            print(i)
        }
    }
    
    func fooo2(n: Int) {
        for i in 0..<n {
            let num = i * i
            print(String(num + i))
            print(i)
            print(num)
        }
    }
    
    func fooo3(n: Int) {
        let wantedNum = Int.random(in: 0...n)
        var leading = 0
        var trailing = n + 1
        
        while leading <= trailing {
            let mid = (trailing + leading) / 2
            if mid >= wantedNum {
                leading = mid + 1
            } else {
                trailing = mid - 1
            }
        }
        print(trailing)
    }
}

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

let dragCost = readLine()!.split(separator: " ").map { Int($0)! }
let holdCost = readLine()!.split(separator: " ").map { Int($0)! }

var dp = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n)
dp[0][0] = dragCost[0]
dp[0][1] = holdCost[0]

for i in 0..<(n - 1) {
    dp[i + 1][0] = min(dp[i][0] + dragCost[i + 1], dp[i][1] + k + dragCost[i + 1])
    dp[i + 1][1] = min(dp[i][1] + holdCost[i + 1], dp[i][0] + k + holdCost[i + 1])
}

print(dp.last!.min()!)
