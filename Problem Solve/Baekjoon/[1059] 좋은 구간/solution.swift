let l = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let s = Set(arr)
let n = Int(readLine()!)!

if s.contains(n) {
    print(0)
} else {
    var min = 0
    var max = 0
    for a in arr {
        if a < n {
            min = a
        } else if a > n && max == 0 {
            max = a
        }
    }
    
    max -= 1
    min += 1
    print((n - min) * (max - n + 1) + max - n)
}
