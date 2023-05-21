let n = Int(readLine()!)!
let m = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var count = 0
for i in 0..<(n - 1) {
    for j in ((i + 1)..<n).reversed() {
        let sum = arr[i] + arr[j]
        if sum < m {
            break
        } else if sum == m {
            count += 1
        }
    }
}
print(count)
