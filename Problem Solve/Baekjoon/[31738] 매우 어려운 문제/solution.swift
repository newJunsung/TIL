let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

if n >= m {
    print(0)
} else {
    var result = 1
    for i in (1...n).reversed() {
        result = (result % m) * (i % m)
    }
    print(result)
}
