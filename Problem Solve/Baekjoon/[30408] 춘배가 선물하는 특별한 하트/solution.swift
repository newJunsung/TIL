let nm = readLine()!.split(separator: " ").map { Int64($0)! }
let (n, m) = (nm[0], nm[1])

var num = n
while num > m && num > 0 {
    if num.isMultiple(of: 2) {
        num /= 2
    } else {
        let temp1 = (num - 1) / 2
        let temp2 = (num - 1) / 2 + 1
        
        var odd: Int64 = 0
        var even: Int64 = 0
        if temp1.isMultiple(of: 2) {
            odd = temp2
            even = temp1
        } else {
            odd = temp1
            even = temp2
        }
        num = even == m ? even : odd
    }
}
print(m == num ? "YES" : "NO")
