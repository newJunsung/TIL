let ab = readLine()!.split(separator: " ").map { Int($0)! }
let a = Set(readLine()!.split(separator: " ").map { Int($0)! })
let b = Set(readLine()!.split(separator: " ").map { Int($0)! })
let inter = a.intersection(b)
print(a.subtracting(inter).count + b.subtracting(inter).count)
