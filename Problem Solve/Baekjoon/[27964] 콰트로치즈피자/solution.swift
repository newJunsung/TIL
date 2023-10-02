//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

final class SwiftProblemSolve {
    
}

var _=readLine()!, set: Set<String> = []
readLine()!.split(separator: " ").map{String($0)}.forEach{ ingredient in
    if ingredient.count >= 6 {
        let start = ingredient.index(ingredient.endIndex, offsetBy: -6)
        let end = ingredient.endIndex
        if ingredient[start..<end] == "Cheese" {
            set.insert(ingredient)
        }
    }
}
print(set.count >= 4 ? "yummy" : "sad")
