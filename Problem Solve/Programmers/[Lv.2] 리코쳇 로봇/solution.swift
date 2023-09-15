import Foundation

struct Queue<T> {
    var input = [T]()
    var output = [T]()
    
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

func solution(_ board:[String]) -> Int {
    let n = board.count
    let m = board[0].count
    
    var robot = (y: 0, x: 0)
    var map = [[String]]()
    for y in (0..<n) {
        var x = 0
        let str = board[y].map { char -> String in
            let s = String(char)
            if s == "R" {
                robot = (y, x)
            }
            x += 1
            return s
        }
        map.append(str)
    }
    
    func move(isY: Bool, isPlus: Bool, y: Int, x: Int) -> (y: Int, x: Int) {
        var newY = y
        var newX = x
        if isY {
            if isPlus {
                for tempY in y..<n {
                    if map[tempY][x] == "D" {
                        break
                    }
                    newY = tempY
                }
            } else {
                for tempY in (0..<y).reversed() {
                    if map[tempY][x] == "D" {
                        break
                    }
                    newY = tempY
                }
            }
        } else {
            if isPlus {
                for tempX in x..<m {
                    if map[y][tempX] == "D" {
                        break
                    }
                    newX = tempX
                }
            } else {
                for tempX in (0..<x).reversed() {
                    if map[y][tempX] == "D" {
                        break
                    }
                    newX = tempX
                }
            }
        }
        return (newY, newX)
    }
    
    let check = [true, true, false, false]
    
    var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    isVisited[robot.y][robot.x] = true
    
    var q = Queue<(y: Int, x: Int, count: Int)>()
    q.enqueue((y: robot.y, x: robot.x, count: 0))
    while !q.isEmpty {
        let info = q.dequeue()
        
        var toggle = true
        for c in check {
            let newInfo = move(isY: c, isPlus: toggle, y: info.y, x: info.x)
            toggle.toggle()
            if (0..<n).contains(newInfo.y) && (0..<m).contains(newInfo.x) && !isVisited[newInfo.y][newInfo.x] {
                if map[newInfo.y][newInfo.x] == "G" {
                    return info.count + 1
                }
                isVisited[newInfo.y][newInfo.x] = true
                q.enqueue((y: newInfo.y, x: newInfo.x, count: info.count + 1))
            }
        }
    }
    
    return -1
}

print(solution(["...D..R", ".D.G...", "....D.D", "D....D.", "..D...."]))
