var s = Set<Substring>()
var answer = ""

let n = Int(readLine()!)!
let arr1 = readLine()!.split(separator: " ")


let m = Int(readLine()!)!
let arr2 = readLine()!.split(separator: " ")
arr2.forEach { char in
    if s.contains(char) {
        answer += "1 "
    } else {
        answer += "0 "
    }
}

answer.removeLast()
print(answer)
