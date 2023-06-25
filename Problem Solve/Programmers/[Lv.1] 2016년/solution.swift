func solution(_ a:Int, _ b:Int) -> String {
    let week = ["SUN", "MON", "TUE", "WED", "THU", "FRI", "SAT"]
    let month = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    
    var index = 5
    if a > 1 {
        for i in 0..<(a - 1) {
            index += month[i]
        }
    }
    index += (b - 1)
    
    return week[index % 7]
}
