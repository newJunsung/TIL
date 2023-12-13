for _ in 0..<Int(readLine()!)! {
    let n = Int(readLine()!)!
    
    var check = false
    var strings = [String]()
    
    for _ in 0..<n {
        strings.append(readLine()!)
    }
    
    for i in 0..<n {
        if check {
             break
        }
        for j in 0..<n where i != j {
            let str = strings[i] + strings[j]
            if str == String(str.reversed()) {
                check = true
                print(str)
                break
            }
        }
    }
    if !check {
        print(0)
    }
}
