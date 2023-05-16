let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let x = Int(readLine()!)!

var index1 = 0
var index2 = n - 1
var count = 0
while index1 < index2 {
    let num = arr[index1] + arr[index2]
    
    if num == x {
        count += 1
        index1 += 1
        index2 -= 1
    } else if num > x {
        index2 -= 1
    } else {
        index1 += 1
    }
}
print(count)
