let t = Int(readLine()!)!

var str = ""
for i in 1...t {
    let nm = readLine()!.split(separator: " ").map{ Int($0)! }
    let arr = readLine()!.split(separator: " ").map{ Int($0)! }
    
    var count = 0
    var left = 0
    var right = nm[0] - 1
    while left < right {
        let sum = arr[left] + arr[right]
        
        if sum < nm[1] {
            left += 1
        } else if sum == nm[1] {
            count += 1
            left += 1
            right -= 1
        } else {
            right -= 1
        }
    }
    str += "Case #\(i): \(count)\n"
}
print(str)
