//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

final class SwiftProblemSolve {
}

var result = ""
for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    
    var category = [String: Int]()
    var closets = [[String]]()
    
    for _ in 0..<n {
        let cloth = readLine()!.split(separator: " ").map { String($0) }
        
        guard let categoryNumber = category[cloth[1]]
        else {
            category[cloth[1]] = closets.count
            let closet = [cloth[0]]
            closets.append(closet)
            continue
        }
        closets[categoryNumber].append(cloth[0])
    }
    
    var count = 1
    for closet in closets {
        count *= (closet.count + 1)
    }
    result += "\(count - 1)\n"
}
print(result)
