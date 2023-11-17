var isPrime = [Bool](repeating: true, count: 119)
isPrime[0] = false
isPrime[1] = false

for i in 2...118 {
    for j in stride(from: i + i, to: 119, by: i) {
        isPrime[j] = false
    }
}

for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    var check = false
    for i in 1...n {
        if isPrime[i] && isPrime[n - i] {
            check = true
        }
    }
    print(check ? "Yes" : "No")
}

