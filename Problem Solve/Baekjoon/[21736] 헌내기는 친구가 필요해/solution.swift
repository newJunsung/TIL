let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let my = [-1, 1, 0, 0]
let mx = [0, 0, -1, 1]

var result = 0
var check = false
var doyeon = (y: 0, x: 0)
var campus = [[String]]()
for y in 0..<n {
    let line = readLine()!.map { String($0) }
    if !check {
        for x in 0..<m {
            if line[x] == "I" {
                doyeon = (y, x)
                check = true
                break
            }
        }
    }
    campus.append(line)
}

func dfs(from coord: (y: Int, x: Int)) {
    campus[coord.y][coord.x] = "X"
    for i in 0..<4 {
        let newY = coord.y + my[i]
        let newX = coord.x + mx[i]
        if (0..<n).contains(newY) && (0..<m).contains(newX) {
            if campus[newY][newX] == "X" { continue }
            if campus[newY][newX] == "P" { result += 1 }
            dfs(from: (y: newY, x: newX))
        }
    }
}

dfs(from: (y: doyeon.y, x: doyeon.x))
print(result == 0 ? "TT" : "\(result)")

