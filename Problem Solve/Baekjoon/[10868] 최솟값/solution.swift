let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var nums = [Int]()
var tree = [Int](repeating: Int.max, count: n * 4)

func makeTree(_ index: Int, from left: Int, to right: Int) -> Int {
    if left == right {
        tree[index] = nums[left]
        return tree[index]
    }
    
    let mid = (left + right) / 2
    let newIndex = index * 2 + 1
    
    let leftNum = makeTree(newIndex, from: left, to: mid)
    let rightNum = makeTree(newIndex + 1, from: mid + 1, to: right)
    
    tree[index] = min(leftNum, rightNum)
    return tree[index]
}

func rangeMin(from left: Int, to right: Int, index: Int, start: Int, end: Int) -> Int {
    if right < start || end < left {
        return Int.max
    }
    
    if start <= left && right <= end {
        return tree[index]
    }
    
    let mid = (left + right) / 2
    let newIndex = index * 2 + 1
    
    let leftNum = rangeMin(from: left, to: mid, index: newIndex, start: start, end: end)
    let rightNum = rangeMin(from: mid + 1, to: right, index: newIndex + 1, start: start, end: end)
    
    return min(leftNum, rightNum)
}

for _ in 0..<n {
    nums.append(Int(readLine()!)!)
}

_ = makeTree(0, from: 0, to: n - 1)

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (a, b) = (ab[0], ab[1])
    print(rangeMin(from: 0, to: n - 1, index: 0, start: a, end: b))
}

