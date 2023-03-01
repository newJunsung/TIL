let input = readLine()!.split(separator: " ").map{ Int(String($0))! }
let n = input[0]
let k = input[1]
let end = 100000

var queue = [(n, 0)]
var visited = [Bool].init(repeating: false, count: end+1)
var idx = 0

while idx < queue.count {
    let (pos, time) = queue[idx]
    visited[pos] = true
    
    if pos == k {
        print(time)
        break
    }
    
    [pos-1, pos+1, pos*2].forEach{
        if 0...end ~= $0 && !visited[$0] {
            queue.append(($0, time+1))
        }
    }
    idx += 1
}
