let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

func foo(_ n: Int, _ k: Int) -> Int {
    var count = 0
    var che = [Bool](repeating: true, count: n + 1)
    che[0] = false
    che[1] = false
    
    for i in 2..<n + 1 {
        for j in stride(from: i, through: n, by: i) {
            if che[j] {
                count += 1
                che[j] = false
            }
            
            if count == k {
                return j
            }
        }
    }
    return 0
}

print(foo(n, k))
