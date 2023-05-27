var set = Set<String>()

let n = Int(readLine()!)!
for _ in 0..<n {
    set.insert(readLine()!)
}

var array = Array(set)
array.sort {
    if $0.count == $1.count {
        return $0 < $1
    } else {
        return $0.count < $1.count
    }
}

var answer = ""
array.forEach { answer += "\($0)\n" }
print(answer)
