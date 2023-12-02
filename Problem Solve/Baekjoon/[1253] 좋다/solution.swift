import Foundation

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator:" ").map{Int(String($0))!}.sorted()
var count = 0

for i in 0..<n {
    var left = 0
    var right = n - 1
    
    while left < right {
        let sum = numbers[left] + numbers[right]
        if sum > numbers[i] {
            right -= 1
        } else if sum < numbers[i] {
            left += 1
        } else if sum == numbers[i] {
            if i != left && i != right {
                count += 1
                break
            } else if i == right {
                right -= 1
            } else {
                left += 1
            }
        }
    }
}
print(count)
