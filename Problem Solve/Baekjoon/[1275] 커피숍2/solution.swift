let qn = readLine()!.split(separator: " ").map { Int($0)! }
let (q, n) = (qn[0], qn[1])

var array = readLine()!.split(separator: " ").map { Int($0)! }
var tree = [Int](repeating: 0, count: q * 4)
var result = ""

func configureTree(arrayRange: ClosedRange<Int>, treeIndex: Int) -> Int {
    let lower = arrayRange.lowerBound
    let upper = arrayRange.upperBound
    
    if lower == upper {
        tree[treeIndex] = array[lower]
        return tree[treeIndex]
    }
    
    let mid = (lower + upper) / 2
    let newIndex = treeIndex * 2 + 1
    let newValue = configureTree(arrayRange: lower...mid, treeIndex: newIndex)
    + configureTree(arrayRange: (mid + 1)...upper, treeIndex: newIndex + 1)
    
    tree[treeIndex] = newValue
    
    return newValue
}

func fetch(
    currentRange: ClosedRange<Int>,
    index: Int,
    targetRange: ClosedRange<Int>
) -> Int {
    let cLower = currentRange.lowerBound
    let cUpper = currentRange.upperBound
    
    let tLower = targetRange.lowerBound
    let tUpper = targetRange.upperBound
    
    if cUpper < tLower || tUpper < cLower {
        return 0
    }
    
    if targetRange ~= cLower && targetRange ~= cUpper {
        return tree[index]
    }
    
    let mid = (cLower + cUpper) / 2
    let newIndex = index * 2 + 1
    let newValue1 = fetch(currentRange: cLower...mid, index: newIndex, targetRange: targetRange)
    let newValue2 = fetch(currentRange: (mid + 1)...cUpper, index: newIndex + 1, targetRange: targetRange)
    
    return newValue1 + newValue2
}

func update(
    currentRange: ClosedRange<Int>,
    target: Int,
    value: Int,
    index: Int
) -> Int {
    let lower = currentRange.lowerBound
    let upper = currentRange.upperBound
    
    if !(currentRange ~= target) {
        return tree[index]
    }
    
    if lower == upper {
        array[target] = value
        tree[index] = value
        return value
    }
    
    let mid = (lower + upper) / 2
    let newIndex = index * 2 + 1
    let newValue = update(currentRange: lower...mid, target: target, value: value, index: newIndex)
    + update(currentRange: (mid + 1)...upper, target: target, value: value, index: newIndex + 1)
    
    tree[index] = newValue
    
    return newValue
}

_ = configureTree(arrayRange: 0...(q - 1), treeIndex: 0)

for _ in 0..<n {
    let xyab = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    let (x, y, a, b) = (xyab[0], xyab[1], xyab[2], xyab[3] + 1)
    
    var f = 0
    if x < y {
        f = fetch(currentRange: 0...(q - 1), index: 0, targetRange: x...y)
    } else {
        f = fetch(currentRange: 0...(q - 1), index: 0, targetRange: y...x)
    }
    _ = update(currentRange: 0...(q - 1), target: a, value: b, index: 0)
    
    result.append("\(f)\n")
}

print(result)
