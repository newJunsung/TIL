let n = Int(readLine()!)!

var busLines = [(s: Int, e: Int, c: Int)]()

for _ in 0..<n {
    let sec = readLine()!.split(separator: " ").map { Int($0)! }
    let info = (sec[0], sec[1], sec[2])
    busLines.append(info)
}

busLines.sort { $0.s < $1.s }

var result = [busLines.first!]
for busLine in busLines {
    let lastRange = result.last!.s...result.last!.e
    let lineRange = busLine.s...busLine.e
    
    let index = result.count - 1
    if lastRange ~= busLine.s {
        result[index].s = min(lastRange.lowerBound, lineRange.lowerBound)
        result[index].e = max(lastRange.upperBound, lineRange.upperBound)
        result[index].c = min(result.last!.c, busLine.c)
    } else {
        result.append(busLine)
    }
}

print(result.count)
result.forEach {
    print("\($0.s) \($0.e) \($0.c)")
}
