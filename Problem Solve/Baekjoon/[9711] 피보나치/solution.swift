for i in 1...Int(readLine()!)! {
    let pq = readLine()!.split(separator: " ").map { Int($0)! }
    let (p, q) = (pq[0], Int64(pq[1]))
    
    var fibo = [Int64](repeating: 1, count: 10_001)
    
    if p >= 3 {
        for i in 3...p {
            fibo[i] = (fibo[i - 1] + fibo[i - 2]) % q
        }
    }
    
    print("Case #\(i): \(fibo[p] % q)")
}
