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
        var wantedNum = Int.random(in: 0...n)
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

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { String($0) }

var maxNum = "0"
var minNum = "10000000000"
var string = [String]()
var isUsed = [Bool](repeating: false, count: 10)

func dfs(_ num: Int) {
    if string.count == n + 1 {
        let tempStr = string.joined()
        let tempNum = Int(tempStr)!
        
        if Int(maxNum)! < tempNum {
            maxNum = tempStr
        }
        
        if Int(minNum)! > tempNum {
            minNum = tempStr
        }
        return
    }
    
    if arr[string.count - 1] == "<" && num + 1 < 10 {
        for i in (num + 1)...9 where !isUsed[i] {
            isUsed[i] = true
            string.append(String(i))
            dfs(i)
            string.removeLast()
            isUsed[i] = false
        }
    }
    if arr[string.count - 1] == ">" && num - 1 >= 0 {
        for i in 0...(num - 1) where !isUsed[i] {
            isUsed[i] = true
            string.append(String(i))
            dfs(i)
            string.removeLast()
            isUsed[i] = false
        }
    }
}

for i in 0...9 {
    isUsed[i] = true
    string.append(String(i))
    dfs(i)
    string.removeLast()
    isUsed[i] = false
}

print(maxNum)
print(minNum)
