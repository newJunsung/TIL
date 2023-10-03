struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    
    public var isEmpty: Bool { input.isEmpty && output.isEmpty }
    
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

var chessboard = [[Bool]](repeating: [Bool](repeating: false, count: 9), count: 10)
var result = -1

let my = [-1, 1, 0, 0]
let mx = [0, 0, -1, 1]

let sang = readLine()!.split(separator: " ").map { Int($0)! }
let wang = readLine()!.split(separator: " ").map { Int($0)! }

var q = Queue<(row: Int, col: Int, count:Int)>()
q.enqueue((row: sang[0], col: sang[1], count: 0))
while !q.isEmpty && result == -1 {
    let info = q.dequeue()
    chessboard[info.row][info.col] = true
    
    if info.row == wang[0] && info.col == wang[1] {
        result = info.count
        break
    }
    
    for i in 0..<4 {
        let tempY = info.row + my[i]
        let tempX = info.col + mx[i]
        
        if !(0..<10).contains(tempY) || !(0..<9).contains(tempX) { continue }
        if wang[0] == tempY && wang[1] == tempX { continue }
        
        if my[i] == 0 {
            checkHudle(info: (row: tempY, col: tempX, count: info.count), my: 1, mx: mx[i], isY: false)
            checkHudle(info: (row: tempY, col: tempX, count: info.count), my: -1, mx: mx[i], isY: false)
            
        } else {
            checkHudle(info: (row: tempY, col: tempX, count: info.count), my: my[i], mx: 1, isY: true)
            checkHudle(info: (row: tempY, col: tempX, count: info.count), my: my[i], mx: -1, isY: true)
        }
    }
}
print(result)

func checkHudle(info: (row: Int, col: Int, count: Int), my: Int, mx: Int, isY: Bool) {
    var tempY = info.row + my
    var tempX = info.col + mx
    
    if !(0..<10).contains(tempY) || !(0..<9).contains(tempX) { return }
    if wang[0] == tempY && wang[1] == tempX { return }
    
    tempY += my
    tempX += mx
    
    if (0..<10).contains(tempY) && (0..<9).contains(tempX) && !chessboard[tempY][tempX] {
        q.enqueue((row: tempY, col: tempX, count: info.count + 1))
    }
}
