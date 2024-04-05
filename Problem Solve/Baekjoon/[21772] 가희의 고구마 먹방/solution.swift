let my = [-1, 1, 0, 0]
let mx = [0, 0, -1, 1]
let rct = readLine()!.split(separator: " ").map { Int($0)! }
let (r, c, t) = (rct[0], rct[1], rct[2])

var dog = (y: 0, x: 0)
var room = [[String]]()
var isEaten = [[Bool]](repeating: [Bool](repeating: false, count: c), count: r)

for y in 0..<r {
    var x = 0
    room.append(readLine()!.map { char in
        let str = String(char)
        if str == "G" {
            dog = (y, x)
        }
        x += 1
        return str
    })
}

func recursive(y: Int, x: Int, time: Int, count: Int) -> Int {
    if time == t {
        return count
    }
    
    var temp = recursive(y: y, x: x, time: time + 1, count: count)
    for i in 0..<4 {
        let newY = y + my[i]
        let newX = x + mx[i]
        
        if (0..<r) ~= newY && (0..<c) ~= newX {
            if room[newY][newX] == "S" {
                if !isEaten[newY][newX] {
                    isEaten[newY][newX] = true
                    temp = max(temp, recursive(y: newY, x: newX, time: time + 1, count: count + 1))
                    isEaten[newY][newX] = false
                } else {
                    temp = max(temp, recursive(y: newY, x: newX, time: time + 1, count: count))
                }
            } else if room[newY][newX] != "#" {
                temp = max(temp, recursive(y: newY, x: newX, time: time + 1, count: count))
            }
        }
    }
    
    return temp
}

print(recursive(y: dog.y, x: dog.x, time: 0, count: 0))
