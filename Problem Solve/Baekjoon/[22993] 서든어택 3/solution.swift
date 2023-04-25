let n = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { UInt64($0)! }

var a1 = array[0]
var array2 = array[1..<n].sorted(by: <)

var check = true
for num in array2 {
    if a1 <= num {
        check = false
        break
    } else {
        a1 += num
    }
}

if check {
    print("Yes")
} else {
    print("No")
}
