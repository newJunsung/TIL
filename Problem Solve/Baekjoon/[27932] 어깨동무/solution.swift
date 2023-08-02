let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
let students = readLine()!.split(separator: " ").map { Int($0)! }

if n == 1 {
    print(0)
} else {
    var leading = 0
    var trailing = Int.max
    while leading <= trailing {
        let mid = (leading + trailing) / 2
        var exhausted = 0
        for i in 0..<n {
            if i == 0 {
                if abs(students[i] - students[i + 1]) > mid {
                    exhausted += 1
                }
            } else if i == (n - 1) {
                if abs(students[i] - students[i - 1]) > mid {
                    exhausted += 1
                }
            } else {
                if abs(students[i] - students[i - 1]) > mid || abs(students[i] - students[i + 1]) > mid {
                    exhausted += 1
                }
            }
        }
        
        if exhausted > k {
            leading = mid + 1
        } else {
            trailing = mid - 1
        }
    }
    print(leading)
}
