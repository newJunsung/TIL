let n = Int(readLine()!)!
let liquids = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var combi = [Int]()
var result = Int.max
for i in 0..<(n - 2) {
    var (left, right) = (i + 1, n - 1)
    
    while left < right {
        let target = liquids[left] + liquids[i] + liquids[right]
        
        if abs(target) < result {
            result = abs(target)
            combi = [left, i, right]
        }
        
        if target <= 0 {
            left += 1
        } else {
            right -= 1
        }
    }
}
print(combi.sorted().map { String(liquids[$0]) }.joined(separator: " "))

