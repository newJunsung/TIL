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

let hy = [1, 2, 2, 1, -1, -2, -2, -1]
let hx = [-2, -1, 1, 2, 2, 1, -1, -2]

let k = Int(readLine()!)!
let wh = readLine()!.split(separator: " ").map { Int($0)! }
let (w, h) = (wh[0], wh[1])

var map = [[Int]]()
for _ in 0..<h {
    map.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var isVisited = [[[Bool]]](repeating: [[Bool]](repeating: [Bool](repeating: false, count: k + 1), count: w), count: h)
isVisited[0][0][0] = true

var result: Int? = nil
var q = Queue<(y: Int, x: Int, hMove: Int, count: Int)>()
q.enqueue((y: 0, x: 0, hMove: 0, count: 0))
while !q.isEmpty {
    let info = q.dequeue()
//    print(info)
    if info.y == h - 1 && info.x == w - 1 {
        result = info.count
        break
    }
    
    if info.hMove < k {
        for i in 0..<8 {
            let newY = info.y + hy[i]
            let newX = info.x + hx[i]
            
            if (0..<h) ~= newY && (0..<w) ~= newX {
                if map[newY][newX] == 0 && !isVisited[newY][newX][info.hMove + 1] {
                    isVisited[newY][newX][info.hMove + 1] = true
                    q.enqueue((y: newY, x: newX, hMove: info.hMove + 1, count: info.count + 1))
                }
            }
        }
    }
    
    for i in 0..<4 {
        let newY = info.y + my[i]
        let newX = info.x + mx[i]
        
        if (0..<h) ~= newY && (0..<w) ~= newX {
            if map[newY][newX] == 0 && !isVisited[newY][newX][info.hMove] {
                isVisited[newY][newX][info.hMove] = true
                q.enqueue((y: newY, x: newX, hMove: info.hMove, count: info.count + 1))
            }
        }
    }
}

print(result ?? -1)
