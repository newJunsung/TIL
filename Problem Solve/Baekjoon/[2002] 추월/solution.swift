let n = Int(readLine()!)!

var entrance = [Int: String]()
var exit = [String: Bool]()

for i in 0..<n {
    let carName = readLine()!
    entrance[i] = carName
    exit[carName] = false
}

var count = 0
var nextIndex = 0

for _ in 0..<n {
    let carName = readLine()!
    exit[carName] = true
    if entrance[nextIndex] == carName {
        while nextIndex < n && exit[entrance[nextIndex]!]! {
            nextIndex += 1
        }
    } else {
        count += 1
    }
}
print(count)
