struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    var isEmpty: Bool { input.isEmpty && output.isEmpty }
    
    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var townCount = 0
var planet = [[Int]]()
for _ in 0..<n {
    let info = readLine()!.map { char -> Int in
        let isTown = Int(String(char))!
        if isTown == 1 {
            townCount += 1
        }
        return isTown
    }
    planet.append(info)
}

func bfs(location1: (y: Int, x: Int), location2: (y: Int, x: Int), townCount: Int) -> Int {
    let my = [-1, 1, 0, 0]
    let mx = [0, 0, -1, 1]
    
    var tempTownCount = townCount
    var isInfested = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    isInfested[location1.y][location1.x] = true
    isInfested[location2.y][location2.x] = true
    
    var q = Queue<(loc: (y: Int, x: Int), count: Int)>()
    q.enqueue((loc: location1, count: 0))
    q.enqueue((loc: location2, count: 0))
    while !q.isEmpty {
        let info = q.dequeue()
        for i in 0..<4 {
            let tempY = info.loc.y + my[i]
            let tempX = info.loc.x + mx[i]
            if (0..<n).contains(tempY) && (0..<m).contains(tempX) && !isInfested[tempY][tempX] {
                if planet[tempY][tempX] == 1 {
                    tempTownCount -= 1
                    if tempTownCount == 0 {
                        return info.count + 1
                    }
                }
                isInfested[tempY][tempX] = true
                q.enqueue((loc: (y: tempY, x: tempX), count: info.count + 1))
            }
        }
    }
    return Int.max
}

var result = Int.max
for y1 in 0..<n {
    for x1 in 0..<m {
        if planet[y1][x1] == 1 { continue }
        for y2 in y1..<n {
            for x2 in x1..<m {
                if planet[y2][x2] == 1 { continue }
                if y1 == y2 && x1 == x2 { continue }
                    result = min(result, bfs(location1: (y: y1, x: x1), location2: (y: y2, x: x2), townCount: townCount))
            }
        }
    }
}
print(result)
