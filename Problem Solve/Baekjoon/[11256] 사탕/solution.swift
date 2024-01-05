for _ in 0..<Int(readLine()!)! {
    let jn = readLine()!.split(separator: " ").map { Int($0)! }
    var j = jn[0]
    let n = jn[1]
    
    var boxes = [Int]()
    for _ in 0..<n {
        boxes.append(readLine()!.split(separator: " ").map { Int($0)! }.reduce(1, *))
    }
    boxes.sort(by: >)
    
    var result = 0
    for box in boxes {
        j -= box
        result += 1
        if j <= 0 {
            break
        }
    }
    print(result)
}
