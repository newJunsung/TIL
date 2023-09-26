let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n,m) = (nm[0], nm[1])

var peoples = [Int](0...n)

func findParent(of index: Int) -> Int {
    if peoples[index] == index {
        return index
    }
    peoples[index] = findParent(of: peoples[index])
    return peoples[index]
}

func union(_ index1: Int, _ index2: Int) {
    let tempIndex1 = findParent(of: index1)
    let tempIndex2 = findParent(of: index2)
    
    var parentIndex1 = 0
    var parentIndex2 = 0
    if tempIndex1 == 0 {
        parentIndex2 = tempIndex2
    } else if tempIndex2 == 0 {
        parentIndex2 = tempIndex1
    } else {
        parentIndex1 = tempIndex1
        parentIndex2 = tempIndex2
    }
    
    peoples[parentIndex2] = parentIndex1
}

let knownPeoples = readLine()!.split(separator: " ").map { Int($0)! }
if knownPeoples[0] > 0 {
    for index in 1...knownPeoples[0] {
        union(0, knownPeoples[index])
    }
}

var partyInfo = [[Int]]()
for _ in 0..<m {
    let participants = readLine()!.split(separator: " ").map { Int($0)! }
    if participants[0] > 1 {
        for index in 2...participants[0] {
            union(participants[1], participants[index])
        }
    }
    partyInfo.append(participants)
}

let me = findParent(of: 0)
var count = 0
for party in partyInfo {
    if me != findParent(of: party[1]) {
        count += 1
    }
}
print(count)
