import Foundation

func dfs(m: Int, n: Int, cabage: inout [[Bool]]) {
    cabage[m][n] = false
    
    let x = [-1, 1, 0, 0]
    let y = [0, 0, -1, 1]
    
    for i in 0..<4 {
        let tempM = m + x[i]
        let tempN = n + y[i]
        
        if tempM < 0 || tempM >= cabage.count || tempN < 0 || tempN >= cabage[tempM].count {
            continue
        }
        
        if cabage[tempM][tempN] {
            dfs(m: tempM, n: tempN, cabage: &cabage)
        }
    }
}

let testcase = Int(readLine()!)!

for _ in 0..<testcase {
    let mnk = readLine()!.split(separator: " ").map { Int($0)! }
    let (m, n, k) = (mnk[0], mnk[1], mnk[2])
    
    var answer = 0
    let temp = [Bool](repeating: false, count: m)
    var cabbage = [[Bool]](repeating: temp, count: n)
    
    for _ in 0..<k {
        let i = readLine()!.split(separator: " ").map { Int($0)! }
        cabbage[i[1]][i[0]] = true
    }
    
    for x in 0..<n {
        for y in 0..<m {
            if cabbage[x][y] {
                dfs(m: x, n: y, cabage: &cabbage)
                answer += 1
            }
        }
    }
    
    print(answer)
}
