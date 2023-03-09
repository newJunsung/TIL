import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var trees = readLine()!.split(separator: " ").map { Int($0)! }
trees.sort(by: >)

var min = 0
var max = trees[0]
var answer = 0

while min <= max {
    let mid = (min + max) / 2
    var length = 0

    for tree in trees {
        if tree - mid < 0 { break }
        length += (tree - mid)
    }
    
    if length >= m {
        answer = mid
        min = mid + 1
    } else {
        max = mid - 1
    }
}

print(answer)
