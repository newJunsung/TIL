let g = Int(readLine()!)!
let p = Int(readLine()!)!

var gates = [Int](0...g)
var count = 0

for _ in 0..<p {
    let gi = Int(readLine()!)!
    let gate = find(gi)
    
    if gate == 0 {
        break
    }
    
    union(gate - 1, gate)
    count += 1
}
print(count)

func find(_ index: Int) -> Int {
    if gates[index] == index {
        return index
    }
    gates[index] = find(gates[index])
    return gates[index]
}

func union(_ a: Int, _ b: Int) {
    let aP = find(a)
    let bP = find(b)
    
    gates[bP] = aP
}
