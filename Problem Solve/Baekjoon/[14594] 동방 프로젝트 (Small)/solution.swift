let n = Int(readLine()!)!
let m = Int(readLine()!)!

var walls = [Bool](repeating: true, count: n - 1)
for _ in 0..<m {
    let xy = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    for i in xy[0]..<xy[1] {
        walls[i] = false
    }
}
print(walls.filter { $0 == true }.count + 1)
