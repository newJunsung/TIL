let n = Int(readLine()!)!
var arr = [(x: Int, y: Int)]()
for _ in 0..<n {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    arr.append((x: xy[0], y: xy[1]))
}
arr.sort {
    if $0.y == $1.y {
        return $0.x < $1.x
    }
    return $0.y < $1.y
}
var result = ""
arr.forEach {
    result += "\($0.x) \($0.y)\n"
}
print(result)
