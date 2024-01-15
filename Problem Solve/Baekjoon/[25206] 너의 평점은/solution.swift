enum Grade: String {
    case aP = "A+"
    case a0 = "A0"
    case bP = "B+"
    case b0 = "B0"
    case cP = "C+"
    case c0 = "C0"
    case dP = "D+"
    case d0 = "D0"
    case p = "P"
    case f = "F"
    
    var asDouble: Double {
        switch self {
        case .aP:
            return 4.5
        case .a0:
            return 4.0
        case .bP:
            return 3.5
        case .b0:
            return 3.0
        case .cP:
            return 2.5
        case .c0:
            return 2.0
        case .dP:
            return 1.5
        case .d0:
            return 1
        case .p:
            return 0
        case .f:
            return 0
        }
    }
}

var totalGrade: Double = 0
var totalCredit: Double = 0

for _ in 0..<20 {
    let info = readLine()!.split(separator: " ").map { String($0) }
    guard let grade = Grade(rawValue: info[2]), grade != .p,
          let credit = Double(info[1]) else {
        continue
    }
    totalCredit += credit
    totalGrade += (grade.asDouble * credit)
}
print(totalGrade / totalCredit)
