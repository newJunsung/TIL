import Foundation

let tc = UInt64(readLine()!)!
var arr: [UInt64] = []
var answer: [UInt64] = [ 0, 1, 2, 4 ]

for _ in 1...tc {
    let n = UInt64(readLine()!)!
    arr.append(n)
}

for i in 4...Int(exactly: arr.max()!)! {
    let n = (answer[i - 1] + answer[i - 2] + answer[i - 3]) % 1_000_000_009
    answer.append(n)
}

for i in arr {
    print(answer[Int(i)])
}
