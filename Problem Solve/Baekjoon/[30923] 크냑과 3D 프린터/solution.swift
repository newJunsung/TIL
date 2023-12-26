let n = Int(readLine()!)!
let sticks = [0] + readLine()!.split(separator: " ").map { Int($0)! } + [0]

var result = 0
for i in 1...(n + 1) {
    let num = sticks[i] * 2 + abs(sticks[i - 1] - sticks[i])
    result += num
}
result += n * 2
print(result)
