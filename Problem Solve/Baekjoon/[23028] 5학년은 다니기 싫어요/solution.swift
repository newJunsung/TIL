let nab = readLine()!.split(separator: " ").map { Int($0)! }

var remainN = 8 - nab[0]
var remainA = 66 - nab[1]
var remainB = 130 - nab[2]

var lectures = [(Int, Int)]()
for _ in 0..<10 {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    lectures.append((info[0], info[1]))
}

var check = false
for lecture in lectures {
    if remainN == 0 { break }
    
    var amount = 6
    amount -= lecture.0
    remainA -= lecture.0 * 3
    remainB -= lecture.0 * 3
    
    if amount > 0 && lecture.1 >= amount {
        remainB -= amount * 3
        amount = 0
    }
    
    if amount > 0 && lecture.1 < amount {
        remainB -= lecture.1 * 3
    }
    
    if remainA <= 0 && remainB <= 0 {
        check = true
        break
    }
    
    remainN -= 1
}

check ? print("Nice") : print("Nae ga wae")
