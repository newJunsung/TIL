var answer = ""
for _ in 0..<Int(readLine()!)! {
    let _ = readLine()!
    let aF = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)
    let bF = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: <)
    
    var count = 0
    for a in aF {
        for b in bF {
            if a > b {
                count += 1
            } else {
                break
            }
        }
    }
    answer += "\(count)\n"
}
print(answer)
