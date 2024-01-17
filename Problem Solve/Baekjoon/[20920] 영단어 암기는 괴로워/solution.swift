let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var dic = [String: Int]()
for _ in 0..<n {
    guard let word = readLine(), word.count >= m else {
        continue
    }
    
    if let count = dic[word] {
        dic[word] = count + 1
    } else {
        dic[word] = 1
    }
}

dic.sorted(by: {
    if $0.value == $1.value {
        if $0.key.count == $1.key.count {
            return $0.key < $1.key
        }
        return $0.key.count > $1.key.count
    }
    return $0.value > $1.value
}).forEach {
    print($0.key)
}

