func check(_ sentence: [String]) -> Bool {
    var stack = [String]()
    
    for str in sentence {
        if str == "(" || str == "[" {
            stack.append(str)
        }
        
        if str == ")" || str == "]" {
            guard let last = stack.last else {
                return false
            }
            
            if str == ")" && last == "(" {
                stack.removeLast()
                continue
            }
            
            if str == "]" && last == "[" {
                stack.removeLast()
                continue
            }
            
            return false
        }
    }
    return stack.isEmpty
}

var result = ""
while let sentence = readLine()?.map({ String($0) }), sentence.first! != "." {
    result += "\(check(sentence) ? "yes" : "no")\n"
}
print(result)
