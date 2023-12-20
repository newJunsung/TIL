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

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let my = [-1, 1, 0, 0]
let mx = [0, 0, -1, 1]

var distances = [[Int]](repeating: [Int](repeating: Int.max, count: m), count: n)
var start = (y: 0, x: 0)
var map = [[Int]]()

for i in 0..<n {
    var j = 0
    let mapSeg = readLine()!.split(separator: " ")
        .map { char -> Int in
            let num = Int(char)!
            if num == 2 {
                start = (i, j)
            }
            
            if num == 0 {
                distances[i][j] = 0
            }
            
            j += 1
            return num
        }
    map.append(mapSeg)
}

var q = Queue<(y: Int, x: Int, count: Int)>()
q.enqueue((y: start.y, x: start.x, count: 0))
while !q.isEmpty {
    let info = q.dequeue()
    if distances[info.y][info.x] <= info.count {
        continue
    }
    distances[info.y][info.x] = info.count
    
    for i in 0..<4 {
        let newY = info.y + my[i]
        let newX = info.x + mx[i]
        
        if (0..<n).contains(newY) && (0..<m).contains(newX) {
            if map[newY][newX] == 1 && distances[newY][newX] > (info.count + 1) {
                q.enqueue((y: newY, x: newX, count: info.count + 1))
            }
        }
    }
}

var result = ""
distances.forEach {
    let str = $0.map { num -> String in
        if num == Int.max {
            return "-1"
        } else {
            return "\(num)"
        }
    }
    result += "\(str.joined(separator: " "))\n"
}
print(result)
