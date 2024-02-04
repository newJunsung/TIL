func getXs(_ str: String) -> [String] {
    let start = str.index(str.startIndex, offsetBy: 1)
    let end = str.index(str.endIndex, offsetBy: -1)
    return str[start..<end].split(separator: ",").map { String($0) }
}

var result = ""
for _ in 0..<Int(readLine()!)! {
    let ps = readLine()!.map { String($0) }
    let _ = Int(readLine()!)!
    let xs = getXs(readLine()!)
    
    var isReversed = false
    var start = 0
    var end = xs.count
    
    result += "\(getResult())\n"
    
    func getResult() -> String {
        for p in ps {
            if p == "R" {
                isReversed.toggle()
            }
            
            if p == "D" {
                if isReversed {
                    end -= 1
                } else {
                    start += 1
                }
            }
            
            if start > end {
                return "error"
            }
        }
        
        if start > end {
            return "[]"
        }
        
        if isReversed {
            return "[\(xs[start..<end].reversed().joined(separator: ","))]"
        } else {
            return "[\(xs[start..<end].joined(separator: ","))]"
        }
    }
}
print(result)
