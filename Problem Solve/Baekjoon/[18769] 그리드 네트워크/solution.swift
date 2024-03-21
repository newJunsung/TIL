var result = ""
for _ in 0..<Int(readLine()!)! {
    let rc = readLine()!.split(separator: " ").map { Int($0)! }
    let (r, c) = (rc[0], rc[1])
    
    var disjointSet = [Int](0..<r * c)
    var costs = [(a: Int, b: Int, cost: Int)]()
    
    for i in 0..<r {
        let rowCosts = readLine()!.split(separator: " ")
        for j in 0..<(c - 1) {
            let a = i * c + j
            let b = a + 1
            costs.append((a: a, b: b, cost: Int(rowCosts[j])!))
        }
    }
    
    for i in 0..<(r - 1) {
        let colCosts = readLine()!.split(separator: " ")
        for j in 0..<c {
            let a = i * c + j
            let b = a + c
            costs.append((a: a, b: b, cost: Int(colCosts[j])!))
        }
    }
    
    costs.sort { $0.cost < $1.cost }
    
    func find(_ index: Int) -> Int {
        if index == disjointSet[index] {
            return index
        }
        disjointSet[index] = find(disjointSet[index])
        return disjointSet[index]
    }
    
    func union(_ a: Int, _ b: Int) -> Bool {
        let aP = find(a)
        let bP = find(b)
        
        if aP != bP {
            disjointSet[bP] = aP
        }
        
        return aP == bP
    }
    
    var total = 0
    for cost in costs {
        if !union(cost.a, cost.b) {
            total += cost.cost
        }
    }
    result += "\(total)\n"
}
print(result)

