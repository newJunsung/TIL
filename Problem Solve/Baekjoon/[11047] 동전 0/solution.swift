import Foundation

let input = readLine()!.split(separator: " ")
let num = Int(input[0])!

var output = 0
var money = Int(input[1])!
var arr: [Int] = []

for _ in 0..<num {
    arr.append(Int(readLine()!)!)
}

arr.sort { $0 > $1 }
for item in arr {
    if money < item {
        continue
    }
    
    output += (money / item)
    money %= item
}

print(output)
