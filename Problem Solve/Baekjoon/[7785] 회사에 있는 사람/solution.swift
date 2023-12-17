var set = Set<String>()
for _ in 0..<Int(readLine()!)! {
    let info = readLine()!.split(separator: " ").map { String($0) }
    
    if info[1] == "enter" {
        set.insert(info[0])
    } else {
        set.remove(info[0])
    }
}
print(set.sorted(by: >).joined(separator: "\n"))

