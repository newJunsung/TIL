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

let rc = readLine()!.split(separator: " ").map { Int($0)! }
let (r, c) = (rc[0], rc[1])

let my = [-1, 1, 0, 0]
let mx = [0, 0, -1, 1]

var miro = [[Character]]()
var jihoon = (y: 0, x: 0)
var fire = [(y: Int, x: Int)]()
for y in 0..<r {
    var x = 0
    let str = readLine()!.map { char -> Character in
        let temp = Character(extendedGraphemeClusterLiteral: char)
        if temp == "J" {
            jihoon.y = y
            jihoon.x = x
        }
        if temp == "F" {
            fire.append((y: y, x: x))
        }
        x += 1
        return temp
    }
    miro.append(str)
}

var count = "IMPOSSIBLE"
var q = Queue<(y: Int, x: Int, count: Int, isFire: Bool)>()
q.enqueue((y: jihoon.y, x: jihoon.x, count: 0, isFire: false))
fire.forEach {
    q.enqueue((y: $0.y, x: $0.x, count: 0, isFire: true))
}
while !q.isEmpty {
    let info = q.dequeue()
    if !info.isFire && miro[info.y][info.x] != "J" {
        continue
    }
    
    var isEscapable = false
    for i in 0..<4 {
        let newY = info.y + my[i]
        let newX = info.x + mx[i]
        
        if (0..<r).contains(newY) && (0..<c).contains(newX) {
            if info.isFire {
                if miro[newY][newX] != "#" && miro[newY][newX] != "F" {
                    miro[newY][newX] = "F"
                    q.enqueue((y: newY, x: newX, count: 0, isFire: true))
                }
            } else {
                if miro[newY][newX] == "." {
                    miro[newY][newX] = "J"
                    q.enqueue((y: newY, x: newX, count: info.count + 1, isFire: false))
                }
            }
        } else if newY == -1 || newY == r || newX == -1 || newX == c {
            if !info.isFire {
                count = "\(info.count + 1)"
                isEscapable = true
                break
            }
        }
    }
    if isEscapable { break }
}
print(count)
