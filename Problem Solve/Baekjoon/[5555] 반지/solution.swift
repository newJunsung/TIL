let cmp = readLine()!

var result = 0
for _ in 0..<Int(readLine()!)! {
    let str = readLine()!
    let ring = (str + str).map { String($0) }
    for i in 0..<(ring.count - cmp.count) {
        if cmp == ring[i..<(i + cmp.count)].joined() {
            result += 1
            break
        }
    }
}
print(result)

