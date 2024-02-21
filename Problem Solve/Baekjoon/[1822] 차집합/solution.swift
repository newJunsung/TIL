_ = readLine()!.split(separator: " ").map { Int($0)! }

var a = Set(readLine()!.split(separator: " ").map { Int($0)! })
let b = readLine()!.split(separator: " ").map { Int($0)! }

let result = a.subtracting(b).sorted().map { String($0) }
print(result.count)
if !result.isEmpty {
    print(result.joined(separator: " "))
}

