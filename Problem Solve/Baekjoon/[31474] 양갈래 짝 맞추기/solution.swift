let n = Int64(readLine()!)!

var result: Int64 = 1
for i in stride(from: 2, through: n, by: 2).reversed() {
    result *= (i * (i - 1)) / 2
    result /= (i / 2)
}
print(result)

