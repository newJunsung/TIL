let n = Int(readLine()!)!

var dic = [String: Int]()
let students = readLine()!.split(separator: " ").map { String($0) }
for student in students {
    dic[student] = dic[student] ?? 0
    
    var arr = readLine()!.split(separator: " ").map { String($0) }
    for a in arr {
        if a == student {
            continue
        } else {
            let count = dic[a] ?? 0
            dic[a] = count + 1
        }
    }
}

let arr = dic.sorted { s1, s2 in
    if s1.value == s2.value {
        return s1.key < s2.key
    }
    return s1.value > s2.value
}

var answer = ""
for a in arr {
    answer += "\(a.key) \(a.value)\n"
}
print(answer)
