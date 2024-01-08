let n = Int(readLine()!)!

var tree = [[(index: Int, weight: Int)]](repeating: [], count: n)
for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    var index = 1
    while info[index] >= 0 {
        tree[info[0]].append((index: info[index], weight: info[index + 1] + 1))
        index += 2
    }
}

func dfs(_ index: Int, _ weight: Int) {
    for edge in tree[index] {
        if weights[edge.index] == -1 {
            let newWeight = weight + edge.weight
            weights[edge.index] = newWeight
            dfs(edge.index, newWeight)
        }
    }
}

var weights = [Int](repeating: -1, count: n)
weights[0] = 0
dfs(0, 0)

var info = (offset: -1, element: -1)
for temp in weights.enumerated() {
    if temp.element > info.element {
        info = temp
    }
}
weights = [Int](repeating: -1, count: n)
weights[info.offset] = 0
dfs(info.offset, 0)
print(weights.max()!)

