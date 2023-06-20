import Foundation

func solution(_ babbling:[String]) -> Int {
    var count = 0
    for b in babbling {
        var isBabble = false
        var last = ""
        var i = 0
        
        if b.count <= 1 {
                continue
        }
        
        while i < b.count {
            if i == (b.count - 1) {
                isBabble = false
                break
            }
            
            if i + 2 <= b.count {
                let startIndex = b.index(b.startIndex, offsetBy: i)
                let endIndex = b.index(b.startIndex, offsetBy: i + 2)
                let two = String(b[startIndex..<endIndex])
                if two == "ma" && two != last {
                    isBabble = true
                    last = "ma"
                    i += 2
                    continue
                } else {
                    isBabble = false
                }
                
                if two == "ye" && two != last {
                    isBabble = true
                    last = "ye"
                    i += 2
                    continue
                } else {
                    isBabble = false
                }
            }
            
            if i + 3 <= b.count {
                let startIndex = b.index(b.startIndex, offsetBy: i)
                let endIndex = b.index(b.startIndex, offsetBy: i + 3)
                let two = String(b[startIndex..<endIndex])
                if two == "aya" && two != last {
                    isBabble = true
                    last = "aya"
                    i += 3
                    continue
                } else {
                    isBabble = false
                }
                
                if two == "woo" && two != last {
                    isBabble = true
                    last = "woo"
                    i += 3
                    continue
                } else {
                    isBabble = false
                }
            }
            
            if !isBabble {
                break
            }
            
            i += 3
        }
        
        if isBabble {
            count += 1
        }
    }
    
    return count
}
