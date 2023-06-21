var n = readLine()!.map { String($0) }
print(n.sorted(by: >).joined(separator: ""))
