let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])

var meetings = [(start: Int, end: Int)]()
for _ in 0..<n {
    let se = readLine()!.split(separator: " ").map { Int($0)! }
    meetings.append((start: se[0], end: se[1]))
}
meetings.sort { $0.end < $1.end }

var result = 0
var rooms = [(start: Int, end: Int)]()
for meeting in meetings {
    rooms.sort { $0.end > $1.end }
    
    var isCheck = false
    for i in 0..<rooms.count {
        if rooms[i].end < meeting.start {
            rooms[i] = meeting
            result += 1
            isCheck = true
            break
        }
    }
    
    if !isCheck && rooms.count < k {
        rooms.append(meeting)
        result += 1
    }
}

print(result)

