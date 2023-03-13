import Foundation

func dfs(x: Int, y: Int, c: Int, visitedAlphabet: Int) {
    count = max(count, c)

    for i in 0..<4 {
        let tempX = x - dx[i]
        let tempY = y - dy[i]

        if tempX < 0 || tempX >= col || tempY < 0 || tempY >= row { continue }

        let alphabet = 1 << graph[tempY][tempX]
        if visitedAlphabet & alphabet == 0  {
            dfs(x: tempX, y: tempY, c: c + 1, visitedAlphabet: visitedAlphabet | alphabet)
        }
    }
}

let rc = readLine()!.split(separator: " ").map { Int($0)! }
let (row, col) = (rc[0], rc[1])
let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

var graph = [[Int]](repeating: [], count: row)
var count = 0

for i in 0..<row {
    graph[i] = readLine()!.map { Int($0.asciiValue!) - 65 }
}

dfs(x: 0, y: 0, c: 1, visitedAlphabet: 1 << graph[0][0] )

print(count)
