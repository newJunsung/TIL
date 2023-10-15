//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

final class SwiftProblemSolve {}

var result = ""
for _ in 0..<Int(readLine()!)! {
    var friendHash = [String: String]()
    var friendCount = [String: Int]()
    
    for _ in 0..<Int(readLine()!)! {
        let names = readLine()!.split(separator: " ").map { String($0) }
        
        for name in names {
            if friendHash[name] == nil {
                friendHash[name] = name
                friendCount[name] = 1
            }
        }
        result += "\(union(lhs: names[0], rhs: names[1]))\n"
    }
    
    func find(_ friend: String) -> String {
        let name = friendHash[friend]!
        
        if friend == name {
            return friend
        }
        friendHash[friend] = find(name)
        
        return friendHash[friend]!
    }
    
    func union(lhs: String, rhs: String) -> Int {
        let leftIndex = friendHash[find(lhs)]!
        let rightIndex = friendHash[find(rhs)]!
        
        if leftIndex != rightIndex {
            friendHash[rightIndex] = leftIndex
            
            let newCount = friendCount[leftIndex]! + friendCount[rightIndex]!
            friendCount[leftIndex] = newCount
            return newCount
        }
        
        return friendCount[leftIndex]!
    }
}

print(result)
