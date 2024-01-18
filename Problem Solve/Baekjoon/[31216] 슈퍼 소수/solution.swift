var che = [Bool](repeating: true, count: 360_000 + 1)
che[0] = false
che[1] = false

for i in 2...600 {
    if !che[i] { continue }
    for j in stride(from: i * i, through: 360_000, by: i) {
        che[j] = false
    }
}

var count = 0
var superPrime = [0]
for (index, isPrime) in che.enumerated() {
    if isPrime {
        count += 1
        if che[count] {
            superPrime.append(index)
        }
    }
}

for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    print(superPrime[n])
}

