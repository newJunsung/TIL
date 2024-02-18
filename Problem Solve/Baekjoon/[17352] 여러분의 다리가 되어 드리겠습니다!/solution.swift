let n = Int(readLine()!)!

var islands = [Int](0...n)

func find(_ index: Int) -> Int {
    if islands[index] == index {
        return index
    }
    islands[index] = find(islands[index])
    return islands[index]
}

func union(_ a: Int, _ b: Int) {
    let aP = find(a)
    let bP = find(b)
    
    if aP != bP {
        islands[bP] = aP
    }
}

for _ in 0..<n - 2 {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (ab[0], ab[1])
    union(a, b)
}

var result = [String]()
for i in 1...n {
    if islands[i] == i {
        result.append("\(i)")
    }
}
print(result.joined(separator: " "))

