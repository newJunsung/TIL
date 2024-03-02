let n = Int(readLine()!)!
let As = readLine()!.split(separator: " ").map { Int($0)! }

var arr = [-Int.max]
for a in As {
    if arr.last! < a {
        arr.append(a)
    } else {
        arr[binarySearch(a)] = a
    }
}
print(arr.count - 1)

func binarySearch(_ num: Int) -> Int {
    var left = 1
    var right = arr.count - 1
    
    while left <= right {
        let mid = (left + right) / 2
        
        if arr[mid] < num {
            left = mid + 1
        } else {
            right = mid - 1
        }
    }
    
    return left
}
