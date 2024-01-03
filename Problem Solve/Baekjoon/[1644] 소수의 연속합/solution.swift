var isPrime = [Bool](repeating: true, count: 4_000_001)
isPrime[0] = false
isPrime[1] = false
for i in 2...200_000 {
    if isPrime[i] {
        for j in stride(from: i + i, through: 4_000_000, by: i) {
            isPrime[j] = false
        }
    }
}

var primes = [0]
for (offset, element) in isPrime.enumerated() {
    if element {
        primes.append(offset)
    }
}

let n = Int(readLine()!)!

var count = 0
var sum = 0
var left = 0
var right = 0
while left <= right {
    if sum == n {
        count += 1
        sum -= primes[left]
        left += 1
        right += 1
        if right == primes.count {
            break
        }
        sum += primes[right]
    } else if sum < n {
        right += 1
        if right == primes.count {
            break
        }
        sum += primes[right]
    } else {
        sum -= primes[left]
        left += 1
    }
}
print(count)
