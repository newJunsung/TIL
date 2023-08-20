import Foundation

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

let nmh = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, h) = (nmh[0], nmh[1], nmh[2])

var q = Queue<(z: Int, y: Int, x: Int, count: Int)>()
var boxes = [[[String]]](repeating: [], count: h)
for i in 0..<(m * h) {
    var x = 0
    let info = readLine()!.split(separator: " ").map { str -> String in
        let char = String(str)
        if char == "1" {
            q.enqueue((z: i / m, y: i % m, x: x, count: 0))
        }
        x += 1
        return char
    }
    boxes[i / m].append(info)
}

let mz = [-1, 1]
let my = [-1, 1, 0, 0]
let mx = [0, 0, -1, 1]

var count = -1
while !q.isEmpty {
    let info = q.dequeue()
    count = info.count
    
    for i in 0..<4 {
        let y = info.y + my[i]
        let x = info.x + mx[i]
        
        if (0..<m).contains(y) && (0..<n).contains(x) {
            if boxes[info.z][y][x] == "0" {
                boxes[info.z][y][x] = "1"
                q.enqueue((z: info.z, y: y, x: x, count: info.count + 1))
            }
        }
    }
    
    for i in mz {
        let z = info.z + i
        if (0..<h).contains(z) {
            if boxes[z][info.y][info.x] == "0" {
                boxes[z][info.y][info.x] = "1"
                q.enqueue((z: z, y: info.y, x: info.x, count: info.count + 1))
            }
        }
    }
}

var check = true
boxes.forEach {
    $0.forEach {
        if $0.contains("0") {
            check = false
        }
    }
}
print(check ? count : -1)
