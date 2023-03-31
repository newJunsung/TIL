var answer = ""
var UDPC = [String: Int]()

UDPC["U"] = 0
UDPC["D"] = 0
UDPC["P"] = 0
UDPC["C"] = 0

let V = readLine()!.map { String($0) }
V.forEach { str in
    UDPC[str]! += 1
}

let maxU = UDPC["U"]! + UDPC["C"]!
let minU = 0

let maxDP = UDPC["D"]! + UDPC["P"]!
let minDP = maxDP.isMultiple(of: 2) ? maxDP / 2 : maxDP / 2 + 1

if maxU > minDP {
    answer += "U"
}

if maxDP > minU {
    answer += "DP"
}

print(answer)
