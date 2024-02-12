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

let ml = [-1, 1, 0, 0, 0 ,0]
let mr = [0, 0, -1, 1, 0, 0]
let mc = [0, 0, 0 ,0, -1, 1]

var result = ""
while let temp = readLine(), temp != "0 0 0"  {
    let lrc = temp.split(separator: " ").map { Int($0)! }
    let (l, r, c) = (lrc[0], lrc[1], lrc[2])
    
    var start = (l: -1, r: -1, c: -1)
    var building = [[[String]]]()
    
    for i in 0..<l {
        var stair = [[String]]()
        for j in 0..<r {
            var k = -1
            let line = readLine()!.map { (char) -> String in
                k += 1
                let str = String(char)
                if str == "S" {
                    start = (i, j, k)
                    return "#"
                }
                return str
            }
            stair.append(line)
        }
        building.append(stair)
        _ = readLine()
    }
    
    var canEscape = false
    var q = Queue<(coord: (l: Int, r: Int, c: Int), count: Int)>()
    q.enqueue((start, count: 0))
    while !q.isEmpty && !canEscape {
        let info = q.dequeue()
        
        for i in 0..<6 {
            let newL = info.coord.l + ml[i]
            let newR = info.coord.r + mr[i]
            let newC = info.coord.c + mc[i]
            
            if !(0..<l).contains(newL) || !(0..<r).contains(newR) || !(0..<c).contains(newC) { continue }
            if building[newL][newR][newC] == "#" { continue }
            if building[newL][newR][newC] == "E" {
                canEscape = true
                result += "Escaped in \(info.count + 1) minute(s).\n"
                break
            }
            building[newL][newR][newC] = "#"
            q.enqueue((coord: (newL, newR, newC), count: info.count + 1))
        }
    }
    
    if !canEscape {
        result += "Trapped!\n"
    }
}
print(result)
