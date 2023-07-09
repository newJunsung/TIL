let nm = readLine()!.split(separator: " ").map { Int($0)! }

var trains = [Int](repeating: 0, count: nm[0] + 1)
for _ in 0..<nm[1] {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    switch info[0] {
    case 1:
        trains[info[1]] |= (1 << info[2])
    case 2:
        trains[info[1]] &= ~(1 << info[2])
    case 3:
        trains[info[1]] &<<= 1
        trains[info[1]] &= ~(1 << 21)
    default:
        trains[info[1]] &>>= 1
        trains[info[1]] &= ~1
    }
}

var set = Set<Int>()
var count = 0
for i in 1...nm[0] {
    if !set.contains(trains[i]) {
        set.insert(trains[i])
        count += 1
    }
}
print(count)
