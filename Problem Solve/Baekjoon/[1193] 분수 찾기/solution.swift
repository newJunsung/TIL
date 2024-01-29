let x = Int(readLine()!)!

var i = 1
var sum = 0
while x > sum {
    sum += i
    i += 1
}

if i.isMultiple(of: 2) {
    print("\(sum - x + 1)/\(i - (sum - x) - 1)")
} else {
    print("\(i - (sum - x) - 1)/\(sum - x + 1)")
}

