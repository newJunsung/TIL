let n = Int(readLine()!)!
let m = Int(readLine()!)!

var cities = [Int](0..<n)
for i in 0..<n {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 0..<n {
        if info[j] == 1 {
            union(i, j)
        }
    }
}

let plan = readLine()!.split(separator: " ").map { Int($0)! - 1 }
var canTrip = true
var prev = find(plan[0])
for i in 0..<m {
    canTrip = (prev == find(plan[i]))
    if !canTrip { break }
}
print(canTrip ? "YES" : "NO")

func find(_ element: Int) -> Int {
    if element != cities[element] {
        cities[element] = find(cities[element])
    }
    return cities[element]
}

func union(_ a: Int, _ b: Int) {
    let aParent = find(a)
    let bParent = find(b)
    cities[bParent] = aParent
}
