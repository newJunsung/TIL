//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var gods = [Int](0..<n)
var godLocations = [(x: Double, y: Double)]()

func find(_ index: Int) -> Int {
    if gods[index] == index {
        return index
    }
    gods[index] = find(gods[index])
    return gods[index]
}

func union(_ a: Int, _ b: Int) {
    let aIndex = find(a)
    let bIndex = find(b)
    
    if aIndex != bIndex {
        gods[bIndex] = aIndex
    }
}


for _ in 0..<n {
    let xy = readLine()!.split(separator: " ").map { Double($0)! }
    godLocations.append((x: xy[0], y: xy[1]))
}

for _ in 0..<m {
    let connected = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    union(connected[0], connected[1])
}

var lengths = [(a: Int, b: Int, length: Double)]()
func getLength(_ a: (x: Double, y: Double), _ b: (x: Double, y: Double)) -> Double {
    return sqrt(pow(abs(a.x - b.x), 2) + pow(abs(a.y - b.y), 2))
}
for i in 0..<(n - 1) {
    for j in (i + 1)..<n {
        lengths.append((a: i, b: j, length: getLength(godLocations[i], godLocations[j])))
    }
}
lengths.sort { $0.length < $1.length }

var result = 0.0
for length in lengths {
    let a = find(length.a)
    let b = find(length.b)
    
    if a != b {
        result += length.length
        union(a, b)
    }
}

result *= 100
print(String(format: "%.2f", result.rounded() / 100))
