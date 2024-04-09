let xym = readLine()!.split(separator: " ").map { Int($0)! }
let (x, y, m) = (xym[0], xym[1], xym[2])

var enemies = [Int]()
var heals = [Int]()
var result = [String]()

for _ in 0..<x {
    enemies.append(Int(readLine()!)!)
}

for _ in 0..<y {
    heals.append(Int(readLine()!)!)
}

if m + heals.reduce(0, +) > enemies.reduce(0, +) {
    var currentM = m
    var xIndex = 0
    var yIndex = 0
    
    while (xIndex + yIndex) < (x + y) {
        if currentM > (m / 2) && xIndex < x {
            currentM -= enemies[xIndex]
            xIndex += 1
            result.append("\(-xIndex)")
        } else if currentM <= (m / 2) && yIndex < y {
            currentM += heals[yIndex]
            yIndex += 1
            result.append("\(yIndex)")
        }
        
        if xIndex == x && yIndex < y {
            while yIndex < y {
                let temp = currentM + heals[yIndex]
                currentM = temp <= m ? temp : m
                yIndex += 1
                result.append("\(yIndex)")
            }
            break
        }
    }
    if xIndex + yIndex == x + y {
        print(result.joined(separator: "\n"))
    } else {
        print(0)
    }
} else {
    print(0)
}

