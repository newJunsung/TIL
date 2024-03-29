let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var nums = [Int]()
var minTree = [Int](repeating: 101, count: n * 4)
var maxTree = [Int](repeating: 0, count: n * 4)

func makeTree(_ index: Int, start: Int, end: Int) -> (min: Int, max: Int) {
    if start == end {
        minTree[index] = nums[start]
        maxTree[index] = nums[start]
        return (nums[start], nums[start])
    }
    
    let mid = (start + end) / 2
    let newIndex = index * 2 + 1
    
    let leftTree = makeTree(newIndex, start: start, end: mid)
    let rightTree = makeTree(newIndex + 1, start: mid + 1, end: end)
    
    minTree[index] = min(leftTree.min, rightTree.min)
    maxTree[index] = max(leftTree.max, rightTree.max)
    
    return (minTree[index], maxTree[index])
}

func find(index: Int, range: ClosedRange<Int>, start: Int, end: Int) -> (min: Int, max: Int) {
    if range.lowerBound > end || range.upperBound < start {
        return (Int.max, 0)
    }
    
    if range ~= start && range ~= end {
        return (minTree[index], maxTree[index])
    }
    
    let mid = (start + end) / 2
    let newIndex = index * 2 + 1
    
    let leftTree = find(index: newIndex, range: range, start: start, end: mid)
    let rightTree = find(index: newIndex + 1, range: range, start: mid + 1, end: end)
    
    let minNum = min(leftTree.min, rightTree.min)
    let maxNum = max(leftTree.max, rightTree.max)
    
    return (minNum, maxNum)
}

for _ in 0..<n {
    nums.append(Int(readLine()!)!)
}

_ = makeTree(0, start: 0, end: n - 1)

for _ in 0..<m {
    let ab = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (a, b) = (ab[0], ab[1])
    let (mn, mx) = find(index: 0, range: a...b, start: 0, end: n - 1)
    print(mn, mx)
}
