let nm = readLine()!.split(separator: " ").map { Int($0)! }
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var count = 0
var left = 0
var right = nm[0] - 1
while left < right {
    let sum = arr[left] + arr[right]
    left += 1
    if sum >= nm[1] {
        count += 1
        right -= 1
    }
}
print(count)
