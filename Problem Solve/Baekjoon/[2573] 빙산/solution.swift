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
            input = [T]()
        }
        
        return output.removeLast()
    }
}

let my = [-1, 1, 0, 0]
let mx = [0, 0, -1, 1]
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var years = 0
var iceberg = [[Int]]()

for _ in 0..<n {
    let ice = readLine()!.split(separator: " ").map { Int($0)! }
    iceberg.append(ice)
}

while true {
    var isVistited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    var count = 0
    var isAllMelt = true
    
    func bfs(_ y: Int, _ x: Int) {
        var q = Queue<(y: Int, x: Int)>()
        q.enqueue((y: y, x: x))
        
        while !q.isEmpty {
            let info = q.dequeue()
            if isVistited[info.y][info.x] || iceberg[info.y][info.x] == 0 { continue }
            isVistited[info.y][info.x] = true
            
            var waterCount = 0
            for i in 0..<4 {
                let newY = info.y + my[i]
                let newX = info.x + mx[i]
                
                if iceberg[newY][newX] == 0 {
                    if !isVistited[newY][newX] {
                        waterCount += 1
                    }
                } else {
                    q.enqueue((y: newY, x: newX))
                }
            }
            
            let temp = iceberg[info.y][info.x] - waterCount
            iceberg[info.y][info.x] = max(temp, 0)
        }
    }
    
    for y in 0..<n {
        for x in 0..<m {
            if iceberg[y][x] != 0 && !isVistited[y][x] {
                count += 1
                isAllMelt = false
                if count >= 2 { break }
                bfs(y, x)
            }
        }
        
        if count >= 2 { break }
    }
    
    if isAllMelt {
        years = 0
        break
    }
    
    if count >= 2 { break }
    
    years += 1
}
print(years)
