let n = Int(readLine()!)!

var planets = [(index: Int, x:Int, y: Int, z: Int)]()
for i in 0..<n {
    let xyz = readLine()!.split(separator: " ").map { Int($0)! }
    let (x, y, z) = (xyz[0], xyz[1], xyz[2])
    planets.append((i, x, y, z))
}

let xSorted = planets.sorted { $0.x < $1.x }
let ySorted = planets.sorted { $0.y < $1.y }
let zSorted = planets.sorted { $0.z < $1.z }

var tunnels = [(a: Int, b: Int, c: Int)]()
for i in 1..<n {
    tunnels.append((a: xSorted[i].index, b: xSorted[i - 1].index, c: getCost(xSorted[i].x, xSorted[i - 1].x)))
    tunnels.append((a: ySorted[i].index, b: ySorted[i - 1].index, c: getCost(ySorted[i].y, ySorted[i - 1].y)))
    tunnels.append((a: zSorted[i].index, b: zSorted[i - 1].index, c: getCost(zSorted[i].z, zSorted[i - 1].z)))
}
tunnels.sort { $0.c < $1.c }

func getCost(_ a: Int, _ b: Int) -> Int {
    abs(a - b)
}

var disjointSet = [Int](0..<n)

func find(_ index: Int) -> Int {
    if disjointSet[index] == index {
        return index
    }
    disjointSet[index] = find(disjointSet[index])
    return disjointSet[index]
}

func union(_ a: Int, _ b: Int) {
    let aP = find(a)
    let bP = find(b)
    
    if aP != bP {
        disjointSet[bP] = aP
    }
}

var result = 0
for tunnel in tunnels {
    let (a, b, c) = tunnel
    let aP = find(a)
    let bP = find(b)
    
    if aP != bP {
        union(aP, bP)
        result += c
    }
}
print(result)

