let n = Int(readLine()!)!

var sum = 0
var ranges = [(start: Int, end: Int)]()

for _ in 0..<n {
    let l = Int(readLine()!)!
    let jewels = readLine()!.split(separator: " ").map { Int($0)! }
    
    var prefixSum = [0]
    
    jewels.forEach { jewel in
        prefixSum.append(prefixSum.last! + jewel)
    }
    
    var maxValue = -Int.max
    var start = 0
    var end = l
    
    for i in 0..<l {
        for j in (i + 1)...l {
            let currentValue = prefixSum[j] - prefixSum[i]

            if maxValue < currentValue {
                maxValue = currentValue
                start = i
                end = j
            } else if maxValue == currentValue {
                if end - start > j - i {
                    start = i
                    end = j
                }
            }
        }
    }
    
    sum += maxValue
    ranges.append((start: start + 1, end: end))
}

print(sum)
ranges.forEach {
    print($0.start, $0.end)
}
