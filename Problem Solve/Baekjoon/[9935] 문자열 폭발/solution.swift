let str = readLine()!.map { String($0) }
let bomb = readLine()!
let lastChar = String(bomb.last!)

var arr = [String]()
for char in str {
    arr.append(char)
    
    if char == lastChar && arr.count >= bomb.count {
        let start = arr.count - bomb.count
        let cmp = arr[start...].joined()
        
        if cmp == bomb {
            for _ in 0..<bomb.count {
                arr.removeLast()
            }
        }
    }
}
print(arr.count == 0 ? "FRULA" : arr.joined())
