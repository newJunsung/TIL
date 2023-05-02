let n = Int(readLine()!)!
var pArr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var answer = [Int](repeating: 0, count: n)
answer[0] = pArr[0]
for i in 0..<(n - 1) {
    answer[i + 1] = pArr[i + 1] + answer[i]
}
print(answer.reduce(0, +))
