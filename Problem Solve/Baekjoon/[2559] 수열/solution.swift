let nk = readLine()!.split(separator: " ").map { Int($0)! - 1 }
let degree = readLine()!.split(separator: " ").map { Int($0)! }

var sum = degree[0...nk[1]].reduce(0, +)
var maxNum = sum
var leftDay = 0
var rightDay = nk[1]
while rightDay < nk[0] {
    rightDay += 1
    sum = sum + degree[rightDay] - degree[leftDay]
    maxNum = max(maxNum, sum)
    leftDay += 1
}
print(maxNum)
