let input = readLine()!.split(separator: " ").map { Int($0) }
let year = (input[0], input[1], input[2])

var output = 1
var e = 1
var s = 1
var m = 1

while true {
    if e > 15 { e = 1 }
    if s > 28 { s = 1 }
    if m > 19 { m = 1 }
    
    if year == (e, s, m) { break }
    
    output += 1
    e += 1
    s += 1
    m += 1
}

print(output)
