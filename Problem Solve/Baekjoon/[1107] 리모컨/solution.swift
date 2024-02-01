let n = Int(readLine()!)!
let m = Int(readLine()!)!

var buttons = Set<Int>()
if m != 0 {
    buttons = Set(readLine()!.split(separator: " ").map { Int($0)! })
}

var count = abs(n - 100)
for i in 0...1_000_000 {
    let tempCount = checkCount(num: i)
    
    if tempCount > 0 {
        count = min(count, tempCount + abs(n - i))
    }
}
print(count)

func checkCount(num: Int) -> Int {
    if num == 0 {
        return buttons.contains(num) ? 0 : 1
    }
    
    var num = num
    var count = 0
    
    while num != 0 {
        if buttons.contains(num % 10) {
            return 0
        }
        count += 1
        num /= 10
    }
    return count
}
