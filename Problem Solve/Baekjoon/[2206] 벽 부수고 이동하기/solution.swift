import Foundation

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()

    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }

    mutating func enqueue(_ newElement: T) {
        input.append(newElement)
    }

    mutating func dequeue() -> T? {
        if self.isEmpty {
            return nil
        }

        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }

        return output.popLast()
    }
}

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let destination = (x: m - 1, y: n - 1)

var isVisited = [[[Bool]]](repeating: [[Bool]](repeating: [false, false], count: m), count: n)
var map = [[Bool]](repeating: [], count: n)
var answer: Int? = nil

for i in 0..<n {
    let wall = readLine()!.map { (char) -> Bool in
        if char == "0" {
            return true
        } else {
            return false
        }
    }

    map[i] = wall
}

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]

isVisited[0][0][1] = true

var queue = Queue<(x: Int, y: Int, count: Int, isBreakable: Int)>()
queue.enqueue((x: 0, y: 0, count: 1, isBreakable: 1))

while !queue.isEmpty {
    var temp = queue.dequeue()!

    if temp.x == destination.x && temp.y == destination.y {
        answer = temp.count
        break
    }

    for i in 0..<4 {
        let tempX = temp.x + dx[i]
        let tempY = temp.y + dy[i]

        if tempX < 0 || tempX >= m || tempY < 0 || tempY >= n { continue }
        
        if isVisited[tempY][tempX][temp.isBreakable] { continue }
        
        if map[tempY][tempX] {
            isVisited[tempY][tempX][temp.isBreakable] = true
            queue.enqueue((x: tempX, y: tempY, count: temp.count + 1, isBreakable: temp.isBreakable))
        }
        
        if !map[tempY][tempX] && temp.isBreakable == 1 {
            isVisited[tempY][tempX][temp.isBreakable] = true
            queue.enqueue((x: tempX, y: tempY, count: temp.count + 1, isBreakable: 0))
        }
    }
}

print(answer ?? -1)
