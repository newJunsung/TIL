let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var controllers = [Int]()
for _ in 0..<n {
    controllers.append(Int(readLine()!)!)
}
controllers.sort()

var left = 0
var right = controllers.first! * m + 1
while (left + 1) < right {
    let mid = (left + right) / 2
    
    var sum = 0
    for controller in controllers {
        sum += mid / controller
    }
    
    if sum < m {
        left = mid
    } else {
        right = mid
    }
}
print(right)
