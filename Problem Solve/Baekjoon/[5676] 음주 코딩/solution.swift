var result = ""

enum NumState: String {
    case minus = "-"
    case zero = "0"
    case plus = "+"
    
    static func transfer(from num: Int) -> Self {
        if num > 0 {
            return .plus
        } else if num == 0 {
            return .zero
        } else {
            return .minus
        }
    }
    
    static func *(_ lhs: Self, _ rhs: Self) -> Self {
        if lhs == .zero || rhs == .zero {
            return .zero
        } else {
            if lhs == rhs {
                return .plus
            } else {
                return .minus
            }
        }
    }
}

while let s = readLine(), s != "" {
    let nk = s.split(separator: " ").map { Int($0)! }
    let (n, k) = (nk[0], nk[1])
    
    var nums = readLine()!.split(separator: " ").map { NumState.transfer(from: Int($0)!) }
    var seg = [NumState](repeating: .plus, count: n * 4)
    var str = ""
    
    func configureSeg(range: ClosedRange<Int>, index: Int) -> NumState {
        let lower = range.lowerBound
        let upper = range.upperBound
        
        if lower == upper {
            seg[index] = nums[lower]
            return seg[index]
        }
        
        let mid = (lower + upper) / 2
        let newIndex = index * 2 + 1
        let leftValue = configureSeg(range: lower...mid, index: newIndex)
        let rightValue = configureSeg(range: (mid + 1)...upper, index: newIndex + 1)
        
        seg[index] = leftValue * rightValue
        
        return seg[index]
    }
    
    func update(range: ClosedRange<Int>, index: Int, target: Int, value: NumState) -> NumState {
        let lower = range.lowerBound
        let upper = range.upperBound
        
        if !(range ~= target) {
            return seg[index]
        }
        
        if lower == upper {
            nums[target] = value
            seg[index] = value
            return seg[index]
        }
        
        let mid = (lower + upper) / 2
        let newIndex = index * 2 + 1
        let leftValue = update(range: lower...mid, index: newIndex, target: target, value: value)
        let rightValue = update(range: (mid + 1)...upper, index: newIndex + 1, target: target, value: value)
        
        seg[index] = leftValue * rightValue
        
        return seg[index]
    }
    
    func fetch(range: ClosedRange<Int>, want: ClosedRange<Int>, index: Int) -> NumState {
        let lower = range.lowerBound
        let upper = range.upperBound
        let wLower = want.lowerBound
        let wUpper = want.upperBound
        
        if upper < wLower || lower > wUpper {
            return .plus
        }
        
        if want ~= lower && want ~= upper {
            return seg[index]
        }
        
        let mid = (lower + upper) / 2
        let newIndex = index * 2 + 1
        let leftValue = fetch(range: lower...mid, want: want, index: newIndex)
        let rightValue = fetch(range: (mid + 1)...upper, want: want, index: newIndex + 1)
        
        return leftValue * rightValue
    }
    
    _ = configureSeg(range: 0...(n - 1), index: 0)
    
    for _ in 0..<k {
        let order = readLine()!.split(separator: " ").map { String($0) }
        
        if order[0] == "C" {
            let (i, v) = (Int(order[1])! - 1, NumState.transfer(from: Int(order[2])!))
            _ = update(range: 0...(n - 1), index: 0, target: i, value: v)
        } else {
            let (i, j) = (Int(order[1])! - 1, Int(order[2])! - 1)
            let value = fetch(range: 0...(n - 1), want: i...j, index: 0).rawValue
            str.append(value)
        }
    }
    
    result.append("\(str)\n")
}

print(result)
