let divider = 1_000_000_007

let my1 = [-1, 0, 1]
let mx1 = [1, 1, 0]
let my2 = [0, 1, 1]
let mx2 = [1, 1, 0]

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var hive = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)

for _ in 0..<Int(readLine()!)! {
    let yx = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (y, x) = (yx[0], yx[1])
    
    hive[y][x] = -1
}
hive[0][0] = 1


for x in 0..<m {
    for y in 0..<n {
        if hive[y][x] == -1 { continue }
        
        let mx = x.isMultiple(of: 2) ? mx1 : mx2
        let my = x.isMultiple(of: 2) ? my1 : my2
        
        for i in 0..<3 {
            let newX = x + mx[i]
            let newY = y + my[i]
            
            if (0..<m).contains(newX)
                && (0..<n).contains(newY) {
                if hive[newY][newX] == -1 { continue }
                
                hive[newY][newX] = (hive[newY][newX] + hive[y][x]) % divider
            }
        }
    }
}

print(hive[n - 1][m - 1])
