let my = [1, 1, 0, -1, -1, -1, 0, 1]
let mx = [0, 1, 1, 1, 0, -1, -1, -1]
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var isPeak = true
var result = 0
var farm = [[Int]]()
var isVisited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)

for _ in 0..<n {
    farm.append(readLine()!.split(separator: " ").map { Int($0)! })
}

func dfs(_ y: Int, _ x: Int) {
    isVisited[y][x] = true
    
    for i in 0..<8 {
        let newY = y + my[i]
        let newX = x + mx[i]
        
        if 0..<n ~= newY && 0..<m ~= newX {
            if farm[y][x] < farm[newY][newX] {
                isPeak = false
            }
            
            if !isVisited[newY][newX] && farm[y][x] == farm[newY][newX] {
                dfs(newY, newX)
            }
        }
    }
}


for i in 0..<n {
    for j in 0..<m {
        if !isVisited[i][j] {
            isPeak = true
            dfs(i, j)
            if isPeak { result += 1 }
        }
    }
}

print(result)
