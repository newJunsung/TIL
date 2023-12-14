let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var people = Array(0...n)
func find(_ index: Int) -> Int {
    if people[index] == index {
        return index
    }
    people[index] = find(people[index])
    return people[index]
}
func union(_ a: Int, _ b: Int) {
    let aP = find(a)
    let bP = find(b)
    
    if aP != bP {
        people[bP] = aP
    }
}

var enemies = [Int](repeating: 0, count: n + 1)
var check = 1
for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (ab[0], ab[1])
    
    if check == 0 {
        continue
    }
    
    let aP = find(a)
    let bP = find(b)
    
    if aP == bP {
        check = 0
        continue
    }
    
    let aEnemy = enemies[a]
    let bEnemy = enemies[b]
    
    if aEnemy != 0 {
        union(b, aEnemy)
    } else {
        enemies[a] = b
    }
    
    if bEnemy != 0 {
        union(a, bEnemy)
    } else {
        enemies[b] = a
    }
}
print(check)
