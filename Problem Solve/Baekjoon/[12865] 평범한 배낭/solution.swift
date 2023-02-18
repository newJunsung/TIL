//
//  coin.swift
//  CodingTest
//
//  Created by 김준성 on 2023/02/17.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
// input[0]: 물품 개수, input[1]: 총 무게
var items: [[String: Int]] = []
var output: [Int] = Array(repeating: 0, count: input[1] + 1)

for _ in 0..<input[0] {
    let arr = readLine()!.split(separator: " ").map { Int($0)! }
    let dic = ["weight" : arr[0], "value" : arr[1]]
    items.append(dic)
}

for item in items {
    if item["weight"]! > input[1] {
        continue
    }
    
    let leftWeight = input[1] - item["weight"]!
    for i in (0...leftWeight).reversed() {
        output[i + item["weight"]!] = max(output[i + item["weight"]!], output[i] + item["value"]!)
    }
    
    output[item["weight"]!] = max(item["value"]!, output[item["weight"]!])
}

print(output.max()!)
