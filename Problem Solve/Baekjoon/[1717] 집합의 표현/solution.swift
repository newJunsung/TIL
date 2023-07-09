let nm = readLine()!.split(separator: " ").map { Int($0)! }

var arr = [Int](0...nm[0])
for _ in 0..<nm[1] {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    let a = info[1], b = info[2]
    
    if info[0] == 0 {
        union(a, b)
    } else {
        print(check(a, b) ? "YES" : "NO")
    }
}

func find(_ child: Int) -> Int {
    if arr[child] == child {
        return child
    }
    arr[child] = find(arr[child])
    return arr[child]
}

func union(_ parent: Int, _ child: Int) {
    let a = find(parent)
    let b = find(child)
    arr[b] = a
}

func check(_ a: Int, _ b: Int) -> Bool {
    return find(a) == find(b)
}
