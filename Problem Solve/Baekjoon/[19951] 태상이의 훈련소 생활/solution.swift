let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let grounds = readLine()!.split(separator: " ").map { Int($0)! }

var sweeping = [Int](repeating: 0, count: n + 2)
for _ in 0..<m {
    let abk = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, k) = (abk[0], abk[1], abk[2])
    
    sweeping[a] += k
    sweeping[b + 1] += -k
}

for i in 1...n {
    sweeping[i] += sweeping[i - 1]
}

var result = ""
for i in 0..<n {
    result += "\(grounds[i] + sweeping[i + 1]) "
}
print(result)

