let s = readLine()!.map { String($0) }

var dic = [String]()
for i in 0..<s.count {
    dic.append(s[i..<s.count].joined())
}
dic.sort(by: <)

var result = ""
dic.forEach { result += "\($0)\n" }
print(result)

