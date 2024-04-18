let n = Int(readLine()!)!

var i = 1
var j = 1

while true {
    var sum = j * (j + 1) / 2
    if n - sum <= 0 {
        break
    } else {
        if (n - sum) % (j + 1) == 0 {
            i += 1
        }
        j += 1
    }
}

print(i)

