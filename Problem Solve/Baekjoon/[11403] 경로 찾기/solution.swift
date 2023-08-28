let n = Int(readLine()!)!
var graph = [[String]](repeating: [], count: n)
for i in 0..<n {
    graph[i] = readLine()!.split(separator: " ").map { String($0) }
}

for i in 0..<n {
    for j in 0..<n {
        for k in 0..<n {
            if graph[j][i] == "1" && graph[i][k] == "1" {
                graph[j][k] = "1"
            }
        }
    }
}
graph.forEach {
    print($0.joined(separator: " "))
}
