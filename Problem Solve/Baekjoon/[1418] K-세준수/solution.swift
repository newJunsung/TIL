let n = Int(readLine()!)!
let k = Int(readLine()!)!

var che = [Int](repeating: 0, count: n + 1)
if n >= 2 {
    for i in 2...n {
        if che[i] == 0 {
            for j in stride(from: i, through: n, by: i) {
                che[j] = max(che[j], i)
            }
        }
    }
}

var result = 0
for i in che {
    if i <= k {
        result += 1
    }
}
print(result - 1)
