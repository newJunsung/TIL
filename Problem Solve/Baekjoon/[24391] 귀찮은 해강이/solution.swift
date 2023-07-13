let nm = readLine()!.split(separator: " ").map { Int($0)! }
var arr = [Int](0..<nm[0])
for _ in 0..<nm[1] {
    let info = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    union(info[0], info[1])
}

var recent = -1
var count = 0
readLine()!.split(separator: " ").forEach { sub in
    let num = find(Int(sub)! - 1)
    if recent != num {
        recent = num
        count += 1
    }
}
print(count - 1)

func find(_ element: Int) -> Int {
    if element != arr[element] {
        arr[element] = find(arr[element])
    }
    return arr[element]
}

func union(_ a: Int, _ b: Int) {
    let parent = find(a)
    let child = find(b)
    arr[child] = parent
}
