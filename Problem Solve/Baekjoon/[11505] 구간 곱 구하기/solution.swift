let divider = 1_000_000_007
let nmk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m ,k) = (nmk[0], nmk[1], nmk[2])

var tree = [Int](repeating: 1, count: n * 4)
var nums = [Int]()

for _ in 0..<n {
    nums.append(Int(readLine()!)!)
}

func makeTree(from left: Int, to right: Int, _ index: Int) -> Int {
    if left == right {
        tree[index] = nums[left]
        return tree[index]
    }
    
    let mid = (left + right) / 2
    let newIndex = index * 2 + 1
    
    tree[index] = makeTree(from: left, to: mid, newIndex) * makeTree(from: mid + 1, to: right, newIndex + 1) % divider
    return tree[index]
}

_ = makeTree(from: 0, to: n - 1, 0)

func update(_ value: Int, from left: Int, to right: Int, index: Int, target: Int) -> Int {
    if left > target || right < target {
        return tree[index]
    }
    
    if left == right {
        nums[target] = value
        tree[index] = value
        return value
    }
    
    let mid = (left + right) / 2
    let newIndex = index * 2 + 1
    let newValue = update(value, from: left, to: mid, index: newIndex, target: target)
    * update(value, from: mid + 1, to: right, index: newIndex + 1, target: target) % divider
    
    tree[index] = newValue
    return newValue
}

func sum(from left: Int, to right: Int, index: Int, start: Int, end: Int) -> Int {
    if right < start || end < left {
        return 1
    }
    
    if start <= left && right <= end {
        return tree[index]
    }
    
    let mid = (left + right) / 2
    let newIndex = index * 2 + 1
    
    return sum(from: left, to: mid, index: newIndex, start: start, end: end)
    * sum(from: mid + 1, to: right, index: newIndex + 1, start: start, end: end) % divider
}

for _ in 0..<(m + k) {
    let abc = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c) = (abc[0], abc[1], abc[2])
    
    if a == 1 {
        _ = update(c, from: 0, to: n - 1, index: 0, target: b - 1)
    } else {
        print(sum(from: 0, to: n - 1, index: 0, start: b - 1, end: c - 1))
    }
}

