let nm = readLine()!.split(separator: " ")
let n = Int(nm[0])!, m = Int64(nm[1])!
let arr = readLine()!.split(separator: " ").map { Int64($0)! }

if n == 1 {
    if m < arr[0] {
        print(0)
    } else {
        print(arr[0])
    }
} else {
    var ans: Int64 = 0
    var sum: Int64 = 0
    var boopie: Int64 = Int64.max
    var left = 0
    var right = 0
    
    while right < n {
        if sum < m && right < n {
            sum += arr[right]
            right += 1
        }
        
        if sum > m {
            sum -= arr[left]
            left += 1
        }
        
        if sum == m {
            ans = sum
            break
        }
        
        if sum <= m && (m - sum) < boopie {
            boopie = m - sum
            ans = sum
        }
    }
    print(ans)
}
