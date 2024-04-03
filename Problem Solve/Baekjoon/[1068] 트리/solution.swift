let n = Int(readLine()!)!

var temp = 0
var root: Int!
var tree = [[Int]](repeating: [], count: n)

readLine()!.split(separator: " ").forEach { ss in
    let node = Int(ss)!
    if node == -1 {
        root = temp
    } else {
        tree[node].append(temp)
    }
    temp += 1
}

let deleteNode = Int(readLine()!)!

var count = 0
func dfs(_ node: Int) {
    if node == deleteNode { return }
    
    var c = 0
    for nextNode in tree[node]
    where nextNode != deleteNode {
        dfs(nextNode)
        c += 1
    }
    
    if c == 0 {
        count += 1
    }
}
dfs(root)
print(count)
