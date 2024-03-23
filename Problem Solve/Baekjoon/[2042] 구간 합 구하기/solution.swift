let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (nmk[0], nmk[1], nmk[2])

var tree = [Int](repeating: 0, count: n * 4)
var nums = [Int]()
for _ in 0..<n {
    nums.append(Int(readLine()!)!)
}

func makeTree(from left: Int, to right: Int, index: Int) -> Int {
    if left == right {
         tree[index] = nums[left]
        return tree[index]
    }
    
    let mid = (left + right) / 2
    let newIndex = index * 2 + 1
    
    tree[index] = makeTree(from: left, to: mid, index: newIndex) + makeTree(from: mid + 1, to: right, index: newIndex + 1)
    
    return tree[index]
}

func update(from left: Int, to right: Int, index: Int, target: Int, value: Int)  {
    if target < left || right < target {
        return
    }
    
    tree[index] += value
    
    if left == right {
        nums[left] += value
        return
    }
    
    let mid = (left + right) / 2
    let newIndex = index * 2 + 1
    
    update(from: left, to: mid, index: newIndex, target: target, value: value)
    update(from: mid + 1, to: right, index: newIndex + 1, target: target, value: value)
}

func sum(from left: Int, to right: Int, index: Int, start: Int, end: Int) -> Int {
    if right < start || end < left {
        return 0
    }
    
    if start <= left && right <= end {
        return tree[index]
    }
    
    let mid = (left + right) / 2
    let newIndex = index * 2 + 1
    
    return sum(from: left, to: mid, index: newIndex, start: start, end: end)
    + sum(from: mid + 1, to: right, index: newIndex + 1, start: start, end: end)
}

_ = makeTree(from: 0, to: n - 1, index: 0)

for _ in 0..<(m + k) {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    
    if a == 1 {
        update(from: 0, to: n - 1, index: 0, target: b - 1, value: c - nums[b - 1])
    } else {
        print(sum(from: 0, to: n - 1, index: 0, start: b - 1, end: c - 1))
    }
}

