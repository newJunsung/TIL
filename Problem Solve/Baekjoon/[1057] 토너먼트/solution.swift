let str = readLine()!.split(separator: " ").map { Int(String($0))! }
var (n, k, l) = (str[0], str[1], str[2])

var answer = 0
while k != l  {
    answer += 1
    
    if !k.isMultiple(of: 2) { k += 1 }
    if !l.isMultiple(of: 2) { l += 1 }
    
    k /= 2
    l /= 2
}
print(answer)
