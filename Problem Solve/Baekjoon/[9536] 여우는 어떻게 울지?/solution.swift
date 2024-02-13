var result = ""
for _ in 0..<Int(readLine()!)! {
    let sounds = readLine()!.split(separator: " ").map { String($0) }
    
    var dic = [String: String]()
    while let info = readLine(), 
            info != "what does the fox say?" {
        let growl = info.split(separator: " ").map { String($0) }
        dic.updateValue(growl[0], forKey: growl[2])
    }
    
    var fox = ""
    for sound in sounds {
        if dic[sound] == nil {
            fox += "\(sound) "
        }
    }
    result += "\(fox)\n"
}
print(result)

