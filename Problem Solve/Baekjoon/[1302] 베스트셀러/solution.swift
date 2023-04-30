let n = Int(readLine()!)!

var dic = [String: Int]()
for _ in 0..<n {
    let book = readLine()!
    let count = ((dic[book] ?? 0))
    dic[book] = count + 1
}

let arr = Array(dic)
let bookName = arr.max {
    if $0.value == $1.value {
        return $0.key > $1.key
    }
    return $0.value < $1.value
}!.key
print(bookName)
