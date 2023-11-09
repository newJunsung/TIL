//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

let fileIO = FileIO()
var result = ""
while true {
    let m = fileIO.readInt()
    let n = fileIO.readInt()
    
    if n == 0 && m == 0 {
        break
    }
    
    var total = 0
    var houses = [Int](0..<m)
    func find(_ index: Int) -> Int {
        if houses[index] == index {
            return index
        }
        
        houses[index] = find(houses[index])
        return houses[index]
    }
    
    func union(_ parent: Int, _ child: Int) {
        let parentHouse = find(parent)
        let childHouse = find(child)
        
        if parent != child {
            houses[childHouse] = parentHouse
        }
    }
    
    var roads = [(x: Int, y: Int, z: Int)]()
    for _ in 0..<n {
        let x = fileIO.readInt()
        let y = fileIO.readInt()
        let z = fileIO.readInt()
        roads.append((x: x, y: y, z: z))
        total += z
    }
    roads.sort { $0.z < $1.z }
    
    var minimum = 0
    for road in roads {
        let parent = find(road.x)
        let child = find(road.y)
        
        if parent != child {
            union(parent, child)
            minimum += road.z
        }
    }
    result += "\(total - minimum)\n"
}
print(result)
