import Foundation

let finger = Int(readLine()!)!
let limit = Int(readLine()!)!

if limit == 0 {
    print(finger - 1)
} else {
    var count = 0
    
    switch(finger) {
    case 1:
        count = limit * 8
    case 5:
        count = limit * 8 + 4
    default:
        count = 5 + (limit - 1) * 4
        
        if limit.isMultiple(of: 2) {
            count += (finger - 2)
        } else {
            count += (4 - finger)
        }
    }

    print(count)
}
