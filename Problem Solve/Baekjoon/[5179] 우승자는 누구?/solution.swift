let k = Int(readLine()!)!

var answer = ""
for i in 1...k {
    let MNP = readLine()!.split(separator: " ").map { Int($0)! }
    
    answer += "Data Set \(i):\n"
    var parti = [(num: Int, count: Int, sum: Int)]()
    for p in 1...MNP[2] {
        parti.append((num: p, count: 0, sum: 0))
    }
    
    
    var parti2 = [[(sol: Bool, tried: Int)]](repeating: [(sol: Bool, tried: Int)](repeating: (sol: false, tried: 0), count: MNP[0]), count: MNP[2])
    for _ in 0..<MNP[1] {
        let info = readLine()!.split(separator: " ")
        let p = Int(info[0])! - 1
        let m = Int(UnicodeScalar(String(info[1]))!.value - 65)
        let t = Int(info[2])!
        let j = Int(info[3])!
        
        if j == 1 && !parti2[p][m].sol {
            parti[p].count += 1
            parti2[p][m].sol = true
            parti[p].sum += parti2[p][m].tried * 20 + t
        }
        if j == 0 {
            parti2[p][m].tried += 1
        }
    }
    
    parti.sort {
        if $0.count == $1.count {
            return $0.sum < $1.sum
        }
        return $0.count > $1.count
    }
    parti.forEach {
        answer += "\($0.num) \($0.count) \($0.sum)\n"
    }
    answer += "\n"
}
print(answer)
