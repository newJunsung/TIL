import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

let num = [0] + readLine()!.split(separator: " ").map { Int($0)! }

var sumArr = [Int](repeating: 0, count: n + 1)
sumArr[0] = 0

for i in 1...n {
    sumArr[i] = sumArr[i - 1] + num[i]
}

for _ in 0..<m {
    let tc = readLine()!.split(separator: " ").map { Int($0)! }
    print(sumArr[tc[1]] - sumArr[tc[0] - 1])
}
