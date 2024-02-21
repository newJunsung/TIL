let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }

var dp = [0]

func binarySearch(for num: Int) -> Int {
    var left = 0
    var right = dp.count
    while left <= right {
        let mid = (left + right) / 2
        
        if num <= dp[mid] {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    
    return left
}

for num in a {
    if dp.last! < num {
        dp.append(num)
    } else {
        let index = binarySearch(for: num)
        dp[index] = num
    }
}
print(dp.count - 1)

