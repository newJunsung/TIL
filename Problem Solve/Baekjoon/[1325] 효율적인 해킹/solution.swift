let nm = readLine()!.split(separator: " ").map { Int($0)! }

var network = [[Int]](repeating: [], count: nm[0])
for _ in 0..<nm[1] {
    let trust = readLine()!.split(separator: " ").map { Int($0)! }
    network[trust[1] - 1].append(trust[0] - 1)
}

var maximum = 0
var count = [Int](repeating: 0, count: nm[0])
for i in 0..<nm[0] {
    var isVisited = [Bool](repeating: false, count: nm[0])
    isVisited[i] = true
    
    var queue = [Int]()
    queue.append(i)
    
    var index = 0
    while index < queue.count {
        let info = queue[index]
        index += 1
        
        for n in network[info] {
            if !isVisited[n] {
                isVisited[n] = true
                queue.append(n)
            }
        }
    }
    
    maximum = max(maximum, index)
    count[i] = index
}

var answer = ""
for i in 0..<nm[0] {
    if count[i] == maximum {
        answer += "\(i + 1) "
    }
}
print(answer)
