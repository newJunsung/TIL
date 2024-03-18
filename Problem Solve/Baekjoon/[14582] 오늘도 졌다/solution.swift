var woolimScore = 0
var startlinkScore = 0
var check = false

let woolimBoard = readLine()!.split(separator: " ").map { Int($0)! }
let startlinkBoard = readLine()!.split(separator: " ").map { Int($0)! }

for i in 0..<9 {
    woolimScore += woolimBoard[i]
    if woolimScore > startlinkScore {
        check = true
    }
    startlinkScore += startlinkBoard[i]
}

print(check ? "Yes" : "No")

