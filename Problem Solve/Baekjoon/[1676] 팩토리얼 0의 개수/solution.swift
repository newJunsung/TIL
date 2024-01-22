var result = 0
for i in (0...Int(readLine()!)!).reversed() {
    if i == 0 { break }
    if i % 125 == 0 {
        result += 3
    } else if i % 25 == 0 {
        result += 2
    } else if i % 5 == 0 {
        result += 1
    }
}
print(result)
