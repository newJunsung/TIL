let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]

var ocean = [[(status: String, islandIndex: Int)]]()
for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { (String($0), 0) }
    ocean.append(line)
}

var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
func dfs(_ y: Int, _ x: Int) {
    for i in 0..<4 {
        let newY = y + dy[i]
        let newX = x + dx[i]
        
        if (0..<n).contains(newY) && (0..<m).contains(newX) {
            if ocean[newY][newX].status == "1" && !isVisited[newY][newX] {
                ocean[newY][newX].islandIndex = islandCount
                isVisited[newY][newX] = true
                dfs(newY, newX)
            }
        }
    }
}

var bridges = [(from: Int, to: Int, cost: Int)]()
func appendBridgeCost(_ y: Int, _ x: Int, dir: (y: Int, x: Int)) {
    var cost = 0
    var newY = y + dir.y
    var newX = x + dir.x
    while (0..<n).contains(newY) && (0..<m).contains(newX) {
        if ocean[newY][newX].status != "0" {
            if cost >= 2 {
                bridges.append((from: ocean[y][x].islandIndex, to: ocean[newY][newX].islandIndex, cost: cost))
            }
            break
        }
        cost += 1
        newY += dir.y
        newX += dir.x
    }
}

var islandCount = 0
for i in 0..<n {
    for j in 0..<m {
        if ocean[i][j].status == "1"{
            if !isVisited[i][j] {
                islandCount += 1
                ocean[i][j].islandIndex = islandCount
                isVisited[i][j] = true
                dfs(i, j)
            }
        }
    }
}

for i in 0..<n {
    for j in 0..<m {
        if ocean[i][j].status == "1"{
            for k in 0..<4 {
                appendBridgeCost(i, j, dir: (dy[k], dx[k]))
            }
        }
    }
}
bridges.sort { $0.cost < $1.cost }

var island = [Int](0...islandCount)

func find(_ index: Int) -> Int {
    if island[index] == index {
        return index
    }
    island[index] = find(island[index])
    return island[index]
}

func union(_ a: Int, _ b: Int) {
    let aP = find(a)
    let bP = find(b)
    
    if aP != bP {
        island[bP] = aP
    }
}

var result = 0
for bridge in bridges {
    let aP = find(bridge.from)
    let bP = find(bridge.to)
    
    if aP != bP {
        result += bridge.cost
        union(aP, bP)
    }
}

func check() {
    let temp = find(island[1])
    for i in 1...islandCount {
        if find(island[i]) != temp  {
            print(-1)
            return
        }
    }
    print(result)
}
check()

