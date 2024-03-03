let n = Int(readLine()!)!
let levels = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)

var result = 0
for i in 1..<n {
    result += levels.first! + levels[i]
}
print(result)

