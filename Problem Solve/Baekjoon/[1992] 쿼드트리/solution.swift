func compress(_ video: [[String]], xRange: Range<Int>, yRange: Range<Int>) -> String {
    let check0 = check(video, xRange: xRange, yRange: yRange, cmp: "0")
    if check0 {
        return "0"
    }
    
    let check1 = check(video, xRange: xRange, yRange: yRange, cmp: "1")
    if check1 {
        return "1"
    }
    
    let xMid = (xRange.lowerBound + xRange.upperBound) / 2
    let yMid = (yRange.lowerBound + yRange.upperBound) / 2
    
    let leftUp = compress(video, xRange: xRange.lowerBound..<xMid, yRange: yRange.lowerBound..<yMid)
    let rightUp = compress(video, xRange: xMid..<xRange.upperBound, yRange: yRange.lowerBound..<yMid)
    let leftDown = compress(video, xRange: xRange.lowerBound..<xMid, yRange: yMid..<yRange.upperBound)
    let rightDown = compress(video, xRange: xMid..<xRange.upperBound, yRange: yMid..<yRange.upperBound)
    
    return "(\(leftUp)\(rightUp)\(leftDown)\(rightDown))"
}

func check(_ video: [[String]], xRange: Range<Int>, yRange: Range<Int>, cmp: String) -> Bool {
    for y in yRange {
        for x in xRange {
            if video[y][x] != cmp {
                return false
            }
        }
    }
    
    return true
}

let n = Int(readLine()!)!

var video = [[String]]()
for _ in 0..<n {
    video.append(readLine()!.map { String($0) })
}

print(compress(video, xRange: 0..<n, yRange: 0..<n))

