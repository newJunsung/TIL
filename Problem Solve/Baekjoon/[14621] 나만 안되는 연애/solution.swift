let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])
let MWs = readLine()!.split(separator: " ").map { String($0) }

var distances = [(u: Int, v: Int, d: Int)]()
for _ in 0..<m {
    let uvd = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (u, v, d) = (uvd[0], uvd[1], uvd[2] + 1)
    if MWs[u] != MWs[v] {
        distances.append((u: u, v: v, d: d))
    }
}
distances.sort { $0.d < $1.d }

var colledges = [Int](0..<n)

func find(_ index: Int) -> Int {
    if index == colledges[index] {
        return index
    }
    colledges[index] = find(colledges[index])
    return colledges[index]
}

func union(_ a: Int, _ b: Int) {
    let aP = find(a)
    let bP = find(b)
    
    if aP != bP {
        colledges[bP] = aP
    }
}

var result = 0
for distance in distances {
    let uP = find(distance.u)
    let vP = find(distance.v)
    
    if uP != vP {
        result += distance.d
        union(uP, vP)
    }
}

let cmp = find(colledges[0])
for colledge in colledges {
    if cmp != find(colledge) {
        result = -1
        break
    }
}

print(result)

