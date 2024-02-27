let n = Int(readLine()!)!
let ports = readLine()!.split(separator: " ").map { Int($0)! }

var dp = [0]

func binarySearch(for port: Int) -> Int {
    var left = 0
    var right = dp.count - 1
    
    while left <= right {
        let mid = (left + right) / 2
        
        if dp[mid] <= port {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return left
}

for port in ports {
    if port > dp.last! {
        dp.append(port)
    } else {
        let index = binarySearch(for: port)
        dp[index] = port
    }
}
print(dp.count - 1)

