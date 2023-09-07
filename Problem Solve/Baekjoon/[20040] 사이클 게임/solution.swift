let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var arr = [Int](0..<n)
func find(_ node: Int) -> Int {
    if arr[node] != node {
        arr[node] = find(arr[node])
    }
    return arr[node]
}
func union(a: Int, b: Int) {
    let node1 = find(a)
    let node2 = find(b)
    arr[node2] = node1
}

var count = 0
for i in 1...m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    if find(ab[0]) == find(ab[1]) {
        count = i
        break
    } else {
        union(a: ab[0], b: ab[1])
    }
}
print(count)
