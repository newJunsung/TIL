var count0 = 0
var count1 = 0
var check = true

var s = readLine()!.map { String($0) }
if s[0] == "0" {
    check = false; count0 += 1
    
} else {
    count1 += 1
}

for i in s[1...s.count-1] {
    if i == "0" && check == true {
        check = false; count0 += 1
    } else if i == "1" && check == false {
        check = true; count1 += 1
    }
}

print(min(count0, count1))
