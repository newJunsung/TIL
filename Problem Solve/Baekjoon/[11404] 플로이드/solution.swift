let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = [[Int]](repeating: [Int](repeating: 10_000_000, count: n), count: n)
for _ in 0..<m {
    let info = readLine()!.split(separator: " ").map { Int($0)! - 1}
    graph[info[0]][info[1]] = min(graph[info[0]][info[1]], info[2] + 1)
}
for i in 0..<n {
    graph[i][i] = 0
}

for i in 0..<n {
    for j in 0..<n {
        for k in 0..<n {
            graph[j][k] = min(graph[j][k], graph[j][i] + graph[i][k])
        }
    }
}
var result = ""
graph.forEach {
    let arr = $0.map { num -> String in
        if num >= 10_000_000 {
            return "0"
        }
        return String(num)
    }
    result += "\(arr.joined(separator: " "))\n"
}
print(result)
