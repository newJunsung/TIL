let n = Int(readLine()!)!
var cows = [(arrive: Int, check: Int)]()
for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    cows.append((info[0], info[1]))
}
cows.sort { $0.arrive < $1.arrive }

var result = 0
for c in cows {
    result = c.arrive < result ? result + c.check : c.arrive + c.check
}
print(result)
