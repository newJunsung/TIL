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

typealias Coord = (y: Int, x: Int)
let my = [1, 0]
let mx = [0, 1]

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var city = [[Int]]()
for _ in 0..<m {
    city.append(readLine()!.split(separator: " ").map { Int($0)! })
}

var q = Queue<Coord>()
q.enqueue((0, 0))

var result = "No"
while !q.isEmpty && result == "No" {
    let (y, x) = q.dequeue()
    
    if y == m - 1 && x == n - 1 {
        result = "Yes"
        break
    }
    
    if city[y][x] == 0 { continue }
    city[y][x] = 0
    
    for i in 0..<2 {
        let nextY = y + my[i]
        let nextX = x + mx[i]
        
        if !((0..<m) ~= nextY && (0..<n) ~= nextX) { continue }
        if nextY == m - 1 && nextX == n - 1 {
            result = "Yes"
            break
        }
        
        if city[nextY][nextX] == 1 {
            q.enqueue((nextY, nextX))
        }
    }
}
print(result)
