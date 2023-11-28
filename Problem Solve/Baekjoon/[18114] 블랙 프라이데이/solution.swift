let nc = readLine()!.split(separator: " ").map { Int($0)! }
let (n, c) = (nc[0], nc[1])
let ws = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

func binary(l: Int, r: Int, weight: Int) -> Int {
    var left = l
    var right = r
    
    while (left + 1) < right {
        let mid = (left + right) / 2
        if ws[mid] < weight {
            left = mid
        } else if ws[mid] == weight {
            return mid
        } else {
            right = mid
        }
    }
    
    return -1
}

func check() {
    if binary(l: 0, r: n - 1, weight: c) >= 0 {
        print(1)
        return
    }
    
    for i in 0..<n {
        let diff = c - ws[i]
        if diff <= 0 {
            break
        }
        if binary(l: i + 1, r: n - 1, weight: diff) >= 0 {
            print(1)
            return
        }
    }
    
    for i in 0..<(n - 1) {
        for j in (i + 1)..<n {
            let diff = c - ws[i] - ws[j]
            if diff <= 0 {
                break
            }
            if binary(l: j + 1, r: n - 1, weight: diff) >= 0 {
                print(1)
                return
            }
        }
    }
    
    print(0)
}
check()
