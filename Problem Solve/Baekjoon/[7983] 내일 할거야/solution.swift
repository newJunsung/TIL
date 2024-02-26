let n = Int(readLine()!)!

var dts = [(day: Int, time: Int)]()
for _ in 0..<n {
    let dt = readLine()!.split(separator: " ").map { Int($0)! }
    let (d, t) = (dt[0], dt[1])
    dts.append((d, t))
}
dts.sort {
    if $0.time == $1.time {
        return $0.day > $1.day
    }
    return $0.time > $1.time
}


var maxRest = dts[0].time
for (day, time) in dts {
    maxRest = min(maxRest, time) - day
}
print(maxRest)
