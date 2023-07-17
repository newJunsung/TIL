let n = Int(readLine()!)!
var aArr = readLine()!.split(separator: " ").map { Int($0)! }
var bArr = [Int]()
for i in 0..<n {
    while !bArr.isEmpty && aArr[i] > aArr[bArr[bArr.count - 1]] {
        aArr[bArr.removeLast()] = aArr[i]
    }
    bArr.append(i)
}
for b in bArr {
    aArr[b] = -1
}
print(aArr.map { String($0) }.joined(separator: " "))
