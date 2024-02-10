let my = [-1, 1, 0, 0]
let mx = [0, 0, -1, 1]
let n = Int(readLine()!)!

var isNormalVisited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var isBlindVisited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var image = [[String]]()
for _ in 0..<n {
    let line = readLine()!.map { String($0) }
    image.append(line)
}

func checkNormal(_ lhs: String, _ rhs: String) -> Bool {
    lhs == rhs
}

func checkBlind(_ lhs: String, _ rhs: String) -> Bool {
    if lhs == "R" {
        if rhs == "G" {
            return true
        }
    }
    if lhs == "G" {
        if rhs == "R" {
            return true
        }
    }
    return lhs == rhs
}

var nCount = 0
var bCount = 0
func dfsNormal(_ coord: (y: Int, x: Int), color: String) {
    let (y, x) = coord
    for i in 0..<4 {
        let newY = y + my[i]
        let newX = x + mx[i]
        
        if (0..<n).contains(newY) && (0..<n).contains(newX) {
            if !isNormalVisited[newY][newX] && checkNormal(color, image[newY][newX]) {
                isNormalVisited[newY][newX] = true
                dfsNormal((y: newY, x: newX), color: image[newY][newX])
            }
        }
    }
}

func dfsBlind(_ coord: (y: Int, x: Int), color: String) {
    let (y, x) = coord
    for i in 0..<4 {
        let newY = y + my[i]
        let newX = x + mx[i]
        
        if (0..<n).contains(newY) && (0..<n).contains(newX) {
            if !isBlindVisited[newY][newX] && checkBlind(color, image[newY][newX]) {
                isBlindVisited[newY][newX] = true
                dfsBlind((y: newY, x: newX), color: image[newY][newX])
            }
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        if !isNormalVisited[i][j] {
            nCount += 1
            isNormalVisited[i][j] = true
            dfsNormal((y: i, x: j), color: image[i][j])
        }
        
        if !isBlindVisited[i][j] {
            bCount += 1
            isBlindVisited[i][j] = true
            dfsBlind((y: i, x: j), color: image[i][j])
        }
    }
}

print(nCount, bCount)
