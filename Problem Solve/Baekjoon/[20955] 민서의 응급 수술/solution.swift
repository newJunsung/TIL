let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var count = 0
var neurons = [Int](0..<n)

func find(_ index: Int) -> Int {
    if neurons[index] == index {
        return index
    }
    neurons[index] = find(neurons[index])
    return neurons[index]
}

func union(_ a: Int, _ b: Int) {
    let aP = find(a)
    let bP = find(b)
    if aP != bP {
        neurons[bP] = aP
    }
}

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (u, v) = (uv[0], uv[1])
    let uP = find(u)
    let vP = find(v)
    if uP == vP {
        count += 1
    } else {
        union(u, v)
    }
}

for i in 1..<n {
    let aP = find(neurons[i - 1])
    let bP = find(neurons[i])
    
    if aP != bP {
        count += 1
        union(aP, bP)
    }
}
print(count)

