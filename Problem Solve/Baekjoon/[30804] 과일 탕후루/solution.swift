let n = Int(readLine()!)!
let fruits = readLine()!.split(separator: " ").map { Int($0)! - 1 }

var fruitCounts = [Int](repeating: 0, count: 9)

func foo(_ left: Int, _ right: Int, _ count: Int, _ kind: Int, _ maxi: Int) -> Int {
    if right >= n {
        return maxi
    }
    
    var tempKind = kind
    if fruitCounts[fruits[right]] == 0 {
        tempKind += 1
    }
    
    var tempCount = count
    tempCount += 1
    fruitCounts[fruits[right]] += 1
    
    var tempLeft = left
    if tempKind > 2 {
        fruitCounts[fruits[left]] -= 1
        if fruitCounts[fruits[left]] == 0 {
            tempKind -= 1
        }
        tempCount -= 1
        tempLeft += 1
    }
    return foo(tempLeft, right + 1, tempCount, tempKind, max(maxi, tempCount))
}

print(foo(0, 0, 0, 0, 0))
