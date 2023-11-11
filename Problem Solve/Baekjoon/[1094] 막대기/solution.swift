let x = Int(readLine()!)!

var count = 0
var stick = 0

while stick != x {
    count += 1
    var temp = 1
    while temp <= x - stick {
        temp *= 2
    }
    if temp != 1 {
        temp /= 2
    }
    stick += temp
}
print(count)

