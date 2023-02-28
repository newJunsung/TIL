import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])

var output = 2500
var str = [[String]](repeating: [], count: n)

for i in 0..<n {
    let s = readLine()!.map { String($0) }
    str[i] = s
}

for x in 0...(n - 8) {
    for y in 0...(m - 8) {
        let b = check(x: x, y: y, str: str, char: "B")
        let w = check(x: x, y: y, str: str, char: "W")
        let o = min(b, w)
        output = min(output, o)
    }
}

print(output)

func check(x: Int, y: Int, str: [[String]], char: String) -> Int {
    let start = char
    var count = 0
    
    for i in x..<(x + 8) {
        for j in y..<(y + 8) {
            if i.isMultiple(of: 2) { // 0, 2, 4, 6
                if j.isMultiple(of: 2) {
                    if str[i][j] != start {
                        count += 1
                    }
                } else {
                    if str[i][j] == start {
                        count += 1
                    }
                }
            } else { // 1, 3, 5, 7
                if j.isMultiple(of: 2) {
                    if str[i][j] == start {
                        count += 1
                    }
                } else {
                    if str[i][j] != start {
                        count += 1
                    }
                }
            }
        }
    }
    

    return count
}
