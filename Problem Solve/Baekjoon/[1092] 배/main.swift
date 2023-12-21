let n = Int(readLine()!)!
let cranes = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
let m = Int(readLine()!)!
var boxes = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)

if cranes.last! < boxes.first! {
    print(-1)
} else {
    var times = 0
    while !boxes.isEmpty {
        times += 1
        for crane in cranes {
            for box in boxes.reversed() {
                if crane >= box {
                    boxes.removeLast()
                    break
                }
            }
        }
    }
    print(times)
}
