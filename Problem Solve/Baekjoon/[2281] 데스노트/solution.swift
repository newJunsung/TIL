let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var names = [Int]()
var dp = [Int](repeating: Int.max, count: n + 1)

for _ in 0..<n {
    names.append(Int(readLine()!)!)
}

func recursive(_ index: Int) -> Int {
    if dp[index] < Int.max {
        return dp[index]
    }
    
    var blank = m - names[index]
    var next = index + 1
    
    while blank >= 0 {
        if next == n {
            dp[index] = 0
            break
        }
        dp[index] = min(dp[index], blank * blank + recursive(next))
        blank -= (names[next] + 1)
        next += 1
    }
    
    return dp[index]
}

print(recursive(0))
