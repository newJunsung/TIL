func getMinMax(of index: (row: Int, col: Int), downs: [[Int]], dp: [[(maxPoint: Int, minPoint: Int)]]) -> (Int, Int) {
    let (row, col) = index
    let left = col - 1
    let mid = col
    let right = col + 1
    
    var maxPoint = 0
    var minPoint = Int.max
    
    if (0..<3).contains(left) {
        maxPoint = max(maxPoint, downs[row][col] + dp[row][left].maxPoint)
        minPoint = min(minPoint, downs[row][col] + dp[row][left].minPoint)
    }
    if (0..<3).contains(mid) {
        maxPoint = max(maxPoint, downs[row][col] + dp[row][mid].maxPoint)
        minPoint = min(minPoint, downs[row][col] + dp[row][mid].minPoint)
    }
    if (0..<3).contains(right) {
        maxPoint = max(maxPoint, downs[row][col] + dp[row][right].maxPoint)
        minPoint = min(minPoint, downs[row][col] + dp[row][right].minPoint)
    }
    
    return (maxPoint, minPoint)
}

let n = Int(readLine()!)!

var downs = [[Int]]()
for _ in 0..<n {
    downs.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var dp = [[
    (maxPoint: 0, minPoint: 0),
    (maxPoint: 0, minPoint: 0),
    (maxPoint: 0, minPoint: 0)
]]
for i in 0..<n {
    dp.append([
        getMinMax(of: (row: i, col: 0), downs: downs, dp: dp),
        getMinMax(of: (row: i, col: 1), downs: downs, dp: dp),
        getMinMax(of: (row: i, col: 2), downs: downs, dp: dp),
    ])
}

var maxPoint = -1
var minPoint = Int.max
dp.last!.forEach {
    maxPoint = max(maxPoint, $0.maxPoint)
    minPoint = min(minPoint, $0.minPoint)
}
print(maxPoint, minPoint)

