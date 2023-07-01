let nk = readLine()!.split(separator: " ").map { Int($0)! }
let dolls = readLine()!.split(separator: " ").map { String($0) }

var lions = 0
var rightIndex = 0
while lions != nk[1] && rightIndex < dolls.count {
    if dolls[rightIndex] == "1" {
        lions += 1
    }
    rightIndex += 1
}

if lions != nk[1] {
    print(-1)
} else {
    var count = rightIndex
    var leftIndex = 0
    while true {
        if dolls[leftIndex] == "1" {
            if rightIndex == dolls.count {
                break
            }
            lions -= 1
            while lions != nk[1] && rightIndex < dolls.count {
                if dolls[rightIndex] == "1" {
                    lions += 1
                }
                rightIndex += 1
            }
        }
        leftIndex += 1
        if lions == nk[1] {
            count = min(count, rightIndex - leftIndex)
        } else {
            break
        }
    }
    print(count)
}
