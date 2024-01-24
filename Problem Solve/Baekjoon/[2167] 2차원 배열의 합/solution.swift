let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var array = [[Int]]()
for _ in 0..<n {
    var temp = [0] + readLine()!.split(separator: " ").map { Int($0)! }
    for i in 1...m {
        temp[i] += temp[i - 1]
    }
    array.append(temp)
}

var result = ""
for _ in 0..<Int(readLine()!)! {
    let ijxy = readLine()!.split(separator: " ").map { Int($0)! }
    let (i, j, x, y) = (ijxy[0], ijxy[1], ijxy[2], ijxy[3])
    
    var sum = 0
    for k in i...x {
        sum += array[k - 1][y] - array[k - 1][j - 1]
    }
    result += "\(sum)\n"
}
print(result)

