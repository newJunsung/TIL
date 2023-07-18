let n = Int(readLine()!)!

var xSmall = 500_001
var xBig = -500_001
var ySmall = 500_001
var yBig = -500_001

var xArr = [(small: Int, big: Int)]()
var yArr = [(small: Int, big: Int)]()
var firstXY = readLine()!.split(separator: " ").map { Int($0)! }
var prevXY = firstXY
for _ in 1..<n {
    let xy = readLine()!.split(separator: " ").map { Int($0)! }
    if xy[0] == prevXY[0] {
        let big = max(xy[1], prevXY[1])
        let small = min(xy[1], prevXY[1])
        xArr.append((small: small, big: big))
        xSmall = min(xSmall, small)
        xBig = max(xBig, big)
    } else {
        let big = max(xy[0], prevXY[0])
        let small = min(xy[0], prevXY[0])
        yArr.append((small: small, big: big))
        ySmall = min(ySmall, small)
        yBig = max(yBig, big)
    }
    prevXY = xy
}
if firstXY[0] == prevXY[0] {
    let big = max(firstXY[1], prevXY[1])
    let small = min(firstXY[1], prevXY[1])
    xArr.append((small: small, big: big))
    xSmall = min(xSmall, small)
    xBig = max(xBig, big)
} else {
    let big = max(firstXY[0], prevXY[0])
    let small = min(firstXY[0], prevXY[0])
    yArr.append((small: small, big: big))
    ySmall = min(ySmall, small)
    yBig = max(yBig, big)
}

var xMax = -10_000_000
for i in (xSmall + 1)..<xBig {
    var count = 0
    for info in xArr {
        if (info.small..<info.big).contains(i) {
            count += 1
        }
    }
    xMax = max(xMax, count)
}

var yMax = -10_000_000
for i in (ySmall + 1)..<yBig {
    var count = 0
    for info in yArr {
        if (info.small..<info.big).contains(i) {
            count += 1
        }
    }
    yMax = max(yMax, count)
}
print(xMax)
print(yMax)
print(max(xMax, yMax))
