//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

final class SwiftProblemSolve {
    private var tree: [TreeNode]
    var result: String = ""
    
    init(tree: [TreeNode] = [TreeNode]()) {
        self.tree = tree
    }
    
    func printResult() {
        print(result)
        result = ""
    }
    
    func preorderTraversal(to node: Int) {
        result += String(UnicodeScalar(node + 65)!)
        if let leftNode = tree[node].left {
            preorderTraversal(to: leftNode)
        }
        if let rightNode = tree[node].right {
            preorderTraversal(to: rightNode)
        }
    }
    
    func inorderTraversal(to node: Int) {
        if let leftNode = tree[node].left {
            inorderTraversal(to: leftNode)
        }
        result += String(UnicodeScalar(node + 65)!)
        if let rightNode = tree[node].right {
            inorderTraversal(to: rightNode)
        }
    }
    
    func postorderTraversal(to node: Int) {
        if let leftNode = tree[node].left {
            postorderTraversal(to: leftNode)
        }
        if let rightNode = tree[node].right {
            postorderTraversal(to: rightNode)
        }
        result += String(UnicodeScalar(node + 65)!)
    }
}

typealias TreeNode = (left: Int?, right: Int?)

var tree = [TreeNode](repeating: TreeNode(nil, nil), count: 26)

let n = Int(readLine()!)!
for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map { Int(UnicodeScalar(String($0))!.value) - 65 }
    let leftNode = info[1] >= 0 ? info[1] : nil
    let rightNode = info[2] >= 0 ? info[2] : nil
    
    tree[info[0]].left = leftNode
    tree[info[0]].right = rightNode
}

let sps = SwiftProblemSolve(tree: tree)
sps.preorderTraversal(to: 0)
sps.printResult()
sps.inorderTraversal(to: 0)
sps.printResult()
sps.postorderTraversal(to: 0)
sps.printResult()
