let nl = readLine()!.split(separator: " ").map { Int($0)! }
let fruits = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
let n = nl[0]
var l = nl[1]

for fruit in fruits {
    if l >= fruit {
        l += 1
    } else {
        break
    }
}
print(l)
