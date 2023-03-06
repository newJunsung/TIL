import Foundation

let nm = readLine()!.split(separator: " ").map { Int($0)! }
var dic = [String: Int]()
var dic2 = [Int: String]()

for i in 1...nm[0] {
    let pokemon = readLine()!
    dic[pokemon] = i
    dic2[i] = pokemon
}

for _ in 0..<nm[1] {
    let question = readLine()!
    if let num = Int(question) {
        print(dic2[num]!)
    } else {
        print(dic[question]!)
    }
}
