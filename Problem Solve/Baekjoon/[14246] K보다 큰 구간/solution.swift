let n = Int(readLine()!)!
let arr1 = readLine()!.split(separator: " ").map { Int($0)! }
let k = Int(readLine()!)!

var arr2 = [0]
for i in 1...n {
    arr2.append(arr1[i - 1] + arr2[i - 1])
}

var sum = 0
for i in 0..<(arr2.count - 1) {
    for j in (i + 1)..<arr2.count {
        let num = arr2[j] - arr2[i]
        if num > k {
            sum += arr2.count - j
            break
        }
    }
}
print(sum)
