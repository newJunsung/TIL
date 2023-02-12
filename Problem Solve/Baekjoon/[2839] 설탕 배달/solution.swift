import Foundation

var input = Int(readLine()!)!
var output = 0

while input >= 3 {
    if input % 5 == 0 {
        output += input / 5
        input = 0
        break;
    }
    
    input -= 3
    output += 1
}

if input != 0 {
    output = -1
}

print(output)
