let n = Int(readLine()!)!
var arr: [(Int, Int)] = []

for _ in 0..<n {
    let a = readLine()!.split(separator: " ").map{Int($0)!}
    arr.append((a[0], a[1]))
}

arr.sort(by: {
    $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0
} )

for x in 0..<n {
    print("\(arr[x].0) \(arr[x].1)")
}
