var result = ""
var day = 1
while let n = Int(readLine()!), n != 0 {
    var attend = [Bool](repeating: false, count: 50)
    var parties = [(start: Int, end: Int)]()
    for _ in 0..<n {
        let info = readLine()!.split(separator: " ").map { Int($0)! * 2 }
        if info[0] == info[1] { continue }
        parties.append((start: info[0], end: info[1]))
    }
    if parties.isEmpty {
        result += "On day \(day) Emma can attend as many as 0 parties.\n"
        continue
    }
    parties.sort {
        return ($0.end - $0.start) < ($1.end - $1.start)
    }
    
    var count = 0
    for party in parties {
        for i in party.start..<party.end {
            if !attend[i] {
                count += 1
                attend[i] = true
                break
            }
        }
    }
    
    result += "On day \(day) Emma can attend as many as \(count) parties.\n"
    day += 1
}
print(result)
