var result = ""
for _ in 0..<Int(readLine()!)! {
    let info = readLine()!.split(separator: " ").map{ Int($0)! }
    var r1 = info[2]
    var r2 = info[5]
    let d = ((info[0] - info[3]) * (info[0] - info[3])) + ((info[1] - info[4]) * (info[1] - info[4]))
    
    if r2 > r1 {
        let temp = r1
        r1 = r2
        r2 = temp
    }
    
    
    if r1 == r2 && d == 0 {
        result += "-1\n"
    }else if (r1 - r2) * (r1 - r2) > d || (r1 + r2) * (r1 + r2) < d  {
        result += "0\n"
    }else if (r1 + r2) * (r1 + r2) == d || d  == (r1 - r2) * (r1 - r2) {
        result += "1\n"
    }else {
        result += "2\n"
    }
}
print(result)
