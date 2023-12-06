let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])
let infos = readLine()!.split(separator: " ").map { Int($0)! }

var check = [Bool](repeating: false, count: n)
var relationships = [Int](0..<n)
var costs = [(id: Int, cost: Int)]()
for info in infos.enumerated() {
    costs.append((id: info.offset, cost: info.element))
}
costs.sort { $0.cost < $1.cost }

for _ in 0..<m {
    let vw = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    if vw[0] != vw[1] {
        union(vw[0], vw[1])
    }
}

var ava = true
var result = 0
for cost in costs {
    let p = find(cost.id)
    if !check[p] {
        check[p] = true
        result += cost.cost
    }
    
    if k < result {
        ava = false
        break
    }
}
print(ava ? result : "Oh no")

func find(_ index: Int) -> Int {
    if relationships[index] == index {
        return index
    }
    relationships[index] = find(relationships[index])
    return relationships[index]
}

func union(_ a: Int, _ b: Int) {
    let aP = find(a)
    let bP = find(b)
    
    if aP != bP {
        relationships[bP] = aP
    }
}
