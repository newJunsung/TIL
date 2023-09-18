let n = Int(readLine()!)!

var baekjoon = [Int]()
var others = [String]()
for _ in 0..<n {
    let study = readLine()!
    if study.count < 8 {
        others.append(study)
    } else {
        let startIndex = study.startIndex
        let endIndex = study.index(startIndex, offsetBy: 6)
        if study[startIndex...endIndex] == "boj.kr/" {
            let numberStartIndex = study.index(startIndex, offsetBy: 7)
            let numberEndIndex = study.endIndex
            guard let problemNumber = Int(study[numberStartIndex..<numberEndIndex]) else {
                others.append(study)
                continue
            }
            baekjoon.append(problemNumber)
        } else {
            others.append(study)
        }
    }
}
baekjoon.sort(by: <)
others.sort {
    if $0.count == $1.count {
        return $0 < $1
    } else {
        return $0.count < $1.count
    }
}

var result = ""
others.forEach {
    result += "\($0)\n"
}
baekjoon.forEach {
    result += "boj.kr/\($0)\n"
}
print(result)
