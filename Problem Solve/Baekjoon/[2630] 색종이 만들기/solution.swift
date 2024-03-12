let n = Int(readLine()!)!

var confetti = [[String]]()
for _ in 0..<n {
    confetti.append(readLine()!.split(separator: " ").map { String($0) })
}

func divideConquer(y: Range<Int>, x: Range<Int>, cmp: String) -> Int {
    var check = true
    for i in y {
        for j in x {
            if confetti[i][j] != cmp {
                check = false
                break
            }
        }
        
        if !check {
            break
        }
    }
    
    if check {
        return 1
    } else {
        let yDiff = y.upperBound - y.lowerBound
        let xDiff = x.upperBound - x.lowerBound
        let yMid = (y.lowerBound + y.upperBound) / 2
        let xMid = (x.lowerBound + x.upperBound) / 2
        
        if yDiff == 1 && xDiff == 1 {
            return 0
        } else if yDiff == 1 && xDiff > 1 {
            return divideConquer(y: y, x: x.lowerBound..<xMid, cmp: cmp) + divideConquer(y: y, x: xMid..<x.upperBound, cmp: cmp)
        } else if yDiff > 1 && xDiff == 1 {
            return divideConquer(y: y.lowerBound..<yMid, x: x, cmp: cmp) + divideConquer(y: yMid..<y.upperBound, x: x, cmp: cmp)
        } else {
            return divideConquer(y: y.lowerBound..<yMid, x: x.lowerBound..<xMid, cmp: cmp) + divideConquer(y: yMid..<y.upperBound, x: x.lowerBound..<xMid, cmp: cmp) + divideConquer(y: yMid..<y.upperBound, x: xMid..<x.upperBound, cmp: cmp) + divideConquer(y: y.lowerBound..<yMid, x: xMid..<x.upperBound, cmp: cmp)
        }
    }
}

print(divideConquer(y: 0..<n, x: 0..<n, cmp: "0"))
print(divideConquer(y: 0..<n, x: 0..<n, cmp: "1"))

