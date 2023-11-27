var count = 0
var set = Set<String>()
for _ in 0..<Int(readLine()!)! {
    let info = readLine()!
    if info == "ENTER" {
        set = Set<String>()
    } else {
        if !set.contains(info) {
            count += 1
            set.insert(info)
        }
    }
}
print(count)
