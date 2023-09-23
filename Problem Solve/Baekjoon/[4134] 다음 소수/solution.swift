var check = [Bool](repeating: true, count: 1_000_001)
check[1] = false
for i in 2...500_000 {
    if !check[i] { continue }
    var index = 2
    while (i * index) <= 1_000_000 {
        check[i * index] = false
        index += 1
    }
}

let mn = readLine()!.split(separator: " ").map { Int($0)! }
let (m, n) = (mn[0], mn[1])

var result = ""
for i in m...n  where check[i] {
    result += "\(i)\n"
}
print(result)
