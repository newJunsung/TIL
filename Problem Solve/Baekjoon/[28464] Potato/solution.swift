let n=Int(readLine()!)!
let a=readLine()!.split(separator: " ").map{Int($0)!}.sorted()
print("\(a[0..<n/2].reduce(0, +)) \(a[n/2..<n].reduce(0, +))")
