struct member{
    var name: String
    var age: Int
    var order: Int
}

let n = Int(readLine()!)!
var memArr: [member] = []

for i in 0..<n {
    let a = readLine()!.split(separator: " ").map { s in
        String(s)
    }
    let mem = member(name: a[1], age: Int(a[0])!, order: i)
    memArr.append(mem)
}

memArr.sort { a, b in
    a.age == b.age ? a.order < b.order : a.age < b.age
}

for j in 0..<n {
    print("\(memArr[j].age) \(memArr[j].name)")
}
