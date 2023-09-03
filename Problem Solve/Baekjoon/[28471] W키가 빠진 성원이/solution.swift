struct Queue<T> {
    private var input = [T]()
    private var output = [T]()
    public var isEmpty: Bool { input.isEmpty && output.isEmpty }
    
    public mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }
    
    public mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}

let n = Int(readLine()!)!
let my = [-1, 0, 0, -1, 1, -1, 1]
let mx = [0, -1, 1, -1, -1, 1, 1]

var f = (y: 0, x: 0)
var miro = [[String]]()
for y in 0..<n {
    var x = 0
    let info = readLine()!.map { char -> String in
        let str = String(char)
        if str == "F" {
            f = (y, x)
        }
        x += 1
        return str
    }
    miro.append(info)
}

var count = 0
var q = Queue<(y: Int, x: Int)>()
q.enqueue(f)
while !q.isEmpty {
    let coordinate = q.dequeue()
    for i in 0..<7 {
        let tempY = coordinate.y + my[i]
        let tempX = coordinate.x + mx[i]
        if (0..<n).contains(tempY) && (0..<n).contains(tempX) {
            if miro[tempY][tempX] == "." {
                miro[tempY][tempX] = "#"
                q.enqueue((tempY, tempX))
                count += 1
            }
        }
    }
}
print(count)
