let n = Int(readLine()!)!

var sum = 0
var ranges = [(start: Int, end: Int)]()

for _ in 0..<n {
    let l = Int(readLine()!)!
    var jewels = readLine()!.split(separator: " ").map { Int($0)! }
    
    var maxValue = jewels.first!
    var start = 0
    var end = 0
    
    var ts = 0
    var te = 0
    
    for i in 1..<l {
        if jewels[i] >= jewels[i] + jewels[i - 1] {
            ts = i
            te = i
        } else {
            jewels[i] = jewels[i] + jewels[i - 1]
            te = i
        }
        
        if jewels[i] > maxValue {
            maxValue = jewels[i]
            start = ts
            end = te
        } else if jewels[i] == maxValue
                    && end - start > te - ts {
            start = ts
            end = te
        }
    }
    
    sum += maxValue
    ranges.append((start: start + 1, end: end + 1))
}

print(sum)
ranges.forEach {
    print($0.start, $0.end)
}
