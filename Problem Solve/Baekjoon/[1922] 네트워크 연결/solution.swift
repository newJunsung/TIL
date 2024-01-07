let n = Int(readLine()!)!
let m = Int(readLine()!)!

var network = [Int](0..<n)
func find(of index: Int) -> Int {
    if network[index] == index {
        return index
    }
    network[index] = find(of: network[index])
    return network[index]
}
func union(_ a: Int, _ b: Int) {
    let aP = find(of: a)
    let bP = find(of: b)
    
    if aP != bP {
        network[bP] = aP
    }
}

var connections = [(a: Int, b: Int, c: Int)]()
for _ in 0..<m {
    let info = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    connections.append((a: info[0], b: info[1], c: info[2] + 1))
}
connections.sort { $0.c < $1.c }

var result = 0
for connection in connections {
    let aP = find(of: connection.a)
    let bP = find(of: connection.b)
    
    if aP != bP {
        result += connection.c
        union(aP, bP)
    }
}
print(result)
