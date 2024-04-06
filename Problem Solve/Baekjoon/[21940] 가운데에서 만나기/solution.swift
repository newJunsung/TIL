let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

var costs = [[Int]](repeating: [Int](repeating: Int(1e9), count: n), count: n)
for i in 0..<n {
    costs[i][i] = 0
}

for _ in 0..<k {
    let abt = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (a, b, t) = (abt[0], abt[1], abt[2] + 1)
    
    costs[a][b] = t
}

_ = readLine()
let friends = readLine()!.split(separator: " ").map { Int($0)! - 1 }

for k in 0..<n {
    for i in 0..<n {
        for j in 0..<n {
            let newValue = costs[i][k] + costs[k][j]
            costs[i][j] = min(costs[i][j], newValue)
        }
    }
}


var current = Int.max
var result = [Int]()

for i in 0..<n {
    var temp = 0
    for friend in friends {
        temp = max(temp, costs[friend][i] + costs[i][friend])
    }
    
    if temp >= 999999 { continue }
    
    if current > temp {
        current = temp
        result = [i + 1]
    } else if current == temp {
        result.append(i + 1)
    }
}

print(result.sorted().map { String($0) }.joined(separator: " "))
