let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var total = 1
var groups = [Int]()

readLine()!.split(separator: " ").forEach { char in
    let num = Int(char)!
    total += num
    groups.append(num)
}

groups.sort(by: >)

if n == 1 && groups.first! == 1 {
    print(0)
} else {
    for i in 0...n {
        var count = 0
        for j in 0..<i {
            count += groups[j]
        }
        
        if count >= total / 2 {
            print(m / (i + 1))
            break
        }
    }
}
