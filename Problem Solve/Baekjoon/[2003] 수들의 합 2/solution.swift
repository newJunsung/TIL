let nm = readLine()!.split(separator: " ").map { Int($0)! }
let arr = readLine()!.split(separator: " ").map { Int($0)! }

var left = 0
var right = 0
var sum = arr[left]

var count = 0
while left<arr.count {
    var check = true
    if sum < nm[1] {
        check = false
    }
    if sum == nm[1] {
        count += 1
    }
    
    if check {
        if left + 1 == arr.count {
            break
        }
        sum -= arr[left]
        left += 1
    } else {
        if right + 1 == arr.count {
            break
        }
        right += 1
        sum += arr[right]
    }
}

print(count)
