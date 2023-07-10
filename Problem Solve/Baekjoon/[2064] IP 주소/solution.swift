func foo(_ sub: Substring) -> String {
    var temp = String(UInt8(sub)!, radix: 2)
    for _ in 0..<8 - temp.count {
        temp = "0" + temp
    }
    return temp
}

func foo2(_ string: String) -> String {
    var temp = ""
    var num = 0
    var binary = 128
    for i in 0..<32 {
        let idx = string.index(string.startIndex, offsetBy: i)
        if string[idx] == "1" {
            num += binary
        }
        binary /= 2
        if binary == 0 {
            temp += "\(num)."
            num = 0
            binary = 128
        }
    }
    let _ = temp.removeLast()
    return temp
}

let n = Int(readLine()!)!

var addresses = [String]()
for _ in 0..<n {
    let ip = readLine()!.split(separator: ".").map { foo($0) }.reduce("") { $0 + $1 }
    addresses.append(ip)
}

var check = false
var diff = -1
for i in 0..<32 {
    if check { break }
    let index = addresses[0].index(addresses[0].startIndex, offsetBy: i)
    for j in 0..<(n - 1) {
        if addresses[j][index] != addresses[j + 1][index] {
            diff = i
            check = true
            break
        }
    }
}

if check {
    let startIdx = addresses[0].startIndex
    let endIdx = addresses[0].index(startIdx, offsetBy: diff)
    
    var address = String(addresses[0][startIdx..<endIdx])
    for _ in 0..<(32 - diff) {
        address += "0"
    }
    
    var mask = ""
    for _ in 0..<diff {
        mask += "1"
    }
    for _ in 0..<(32 - diff) {
        mask += "0"
    }
    
    print(foo2(address))
    print(foo2(mask))
} else {
    print(foo2(addresses[0]))
    print("255.255.255.255")
}
