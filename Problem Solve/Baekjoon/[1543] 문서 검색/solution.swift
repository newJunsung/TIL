let document = readLine()!.map { String($0) }
let word = readLine()!.map { String($0) }

var count = 0
var index = 0
if document.count == word.count {
    if document == word {
        print(1)
    } else {
        print(0)
    }
} else {
    while index <= document.count - word.count {
        var check = true
        for i in 0..<word.count {
            if document[index + i] != word[i] {
                check = false
                break
            }
        }
        if check {
            count += 1
            index += word.count
        } else {
            index += 1
        }
    }
    print(count)
}
