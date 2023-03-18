import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var count = 0
var map = [[Int]](repeating: [], count: n + 1)
var isVisited = [Bool](repeating: false, count: n + 1)

isVisited[0] = true

for _ in 0..<m {
    let str = readLine()!.split(separator: " ").map { Int($0)! }
    map[str[0]].append(str[1])
    map[str[1]].append(str[0])
}

for i in 1...n {
    if !isVisited[i] {
        dfs(i)
        count += 1
    }
}

print(count)

func dfs(_ num: Int) {
    for i in map[num] {
        if !isVisited[i] {
            isVisited[i] = true
            dfs(i)
        }
    }
}
