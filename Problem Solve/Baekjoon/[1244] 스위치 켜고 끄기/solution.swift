let n = Int(readLine()!)!

var switches = readLine()!.split(separator: " ").map { (substr) -> Bool in
    if String(substr) == "1" { return true }
    else { return false }
}

let students = Int(readLine()!)!

for _ in 0..<students {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    let number = info[1] - 1

    if info[0] == 1 {
        for i in number..<n {
            if (i + 1) % info[1] == 0 {
                switches[i].toggle()
            }
        }
    } else {
        switches[info[1] - 1].toggle()

        var j = 1
        while (number - j) >= 0 && (number + j) < n {
            if switches[number - j] == switches[number + j] {
                switches[number - j].toggle()
                switches[number + j].toggle()
            } else {
                 break
            }

            j += 1
        }
    }
}

for i in 0..<n {
    var terminator = " "
    
    if (i + 1) % 20 == 0 {
        terminator = "\n"
    }
    
    if switches[i] {
        print(1, terminator: terminator)
    } else {
        print(0, terminator: terminator)
    }
}
