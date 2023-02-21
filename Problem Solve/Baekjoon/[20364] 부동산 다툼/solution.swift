import Foundation

let nq = readLine()!.split(separator: " ").map { Int($0)! }
//let (n, q) = (nq[0], nq[1])

var lands = Set<Int>()
var str = ""

for _ in 0..<nq[1] {
    let wanted = Int(readLine()!)!
    var temp = wanted, ans = 0

    while temp != 0 {
        if lands.contains(temp) {
            ans = temp
        }

        temp /= 2
    }
    
    if ans == 0 {
        str += "0\n"
        lands.insert(wanted)
    } else {
        str += "\(ans)\n"
    }
}

print(str)
