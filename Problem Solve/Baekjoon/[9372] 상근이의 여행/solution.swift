var result = ""
for _ in 0..<Int(readLine()!)! {
    let nm = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (nm[0], nm[1])
    
    var countries = [Int](0..<n)
    var count = 0
    
    func find(_ index: Int) -> Int {
        if countries[index] == index {
            return index
        }
        countries[index] = find(countries[index])
        return countries[index]
    }
    
    func union(_ a: Int, _ b: Int) {
        let aParent = find(a)
        let bParent = find(b)
        
        if aParent != bParent {
            countries[bParent] = aParent
        }
    }
    
    for _ in 0..<m {
        let ab = readLine()!.split(separator: " ").map { Int($0)! - 1 }
        let (a, b) = (ab[0], ab[1])
        
        let aParent = find(a)
        let bParent = find(b)
        
        if aParent != bParent {
            count += 1
            union(aParent, bParent)
        }
    }
    result += "\(count)\n"
}
print(result)

