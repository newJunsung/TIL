import Foundation

func solution(_ s:String, _ skip:String, _ index:Int) -> String {
    let tempS = s.map { $0.asciiValue! - 97 }
    let tempSkip = skip.map { $0.asciiValue! - 97 }
    
    let answer = tempS.map { ascii -> Character in
        var tempAscii = ascii
        var i = 0
        while i < index {
            tempAscii += 1
            tempAscii %= 26
            if tempSkip.contains(tempAscii) {
                continue
            }
            i += 1
        }
        return Character(UnicodeScalar(tempAscii + 97))
    }
    
    return String(answer)
}

print(solution("uvqsu", "abcdefghij", 19))
