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

let nk = readLine()!.split(separator: " ")
let (n, k) = (Int(nk[0])!, Int(nk[1])!)
let numSet = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)

var result = -1
var len = 1
while n / len != 0 {
    len *= 10
}

func recursive(_ cmp: Int, _ len: Int) {
    if cmp / len != 0 {
        if cmp <= n  {
            result = max(cmp, result)
        }
        return
    }
    
    for num in numSet {
        recursive(cmp * 10 + num, len)
    }
}

while result == -1 {
    for num in numSet {
        recursive(num, len)
    }
    len /= 10
}
print(result)
