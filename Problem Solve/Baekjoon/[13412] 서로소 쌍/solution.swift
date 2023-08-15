var result = ""
for _ in 0..<Int64(readLine()!)! {
    let n = Int64(readLine()!)!
    var count = 0
    for i in 1...n {
        if i * i > n { break }
        if n % i == 0 && gcd(n / i, i) == 1 {
            count += 1
        }
    }
    result += "\(count)\n"
}
print(result)

func gcd(_ lhs: Int64, _ rhs: Int64) -> Int64 {
    if rhs == 0 {
        return lhs
    }
    return gcd(rhs, lhs % rhs)
}
