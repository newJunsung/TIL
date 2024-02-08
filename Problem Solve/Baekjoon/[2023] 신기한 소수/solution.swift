let primes = [2, 3, 5, 7]
let odds = [1, 3, 5, 7, 9]
let n = Int(readLine()!)!

var result = ""
var isUsed = [Bool](repeating: false, count: 4)

func isPrime(_ num: Int) -> Bool {
    if num == 2 { return true }
    
    for n in 2...num {
        if num % n == 0 { return false }
        if n * n > num { break }
    }
    
    return true
}

func find(_ num: Int, count: Int) {
    if count == n {
        result += "\(num)\n"
        return
    }
    
    for odd in odds {
        let temp = num * 10 + odd
        if isPrime(temp) {
            find(temp, count: count + 1)
        }
    }
}

for prime in primes {
    find(prime, count: 1)
}

print(result)

