import Foundation

let n = Int(readLine()!)!

var stars = [(x: Double, y: Double)]()
var distances = [(a: Int, b: Int, cost: Double)]()
var isConnected = [Int](0..<n)

func getCost(_ a: (x: Double, y: Double), _ b: (x: Double, y: Double)) -> Double {
    let x = abs(a.x - b.x)
    let y = abs(a.y - b.y)
    return floor(sqrt(x * x + y * y) * 100) / 100
}

func find(_ index: Int) -> Int {
    if isConnected[index] == index {
        return index
    }
    isConnected[index] = find(isConnected[index])
    return isConnected[index]
}

func union(_ a: Int, _ b: Int) {
    let aP = find(a)
    let bP = find(b)
    
    if aP != bP {
        isConnected[bP] = aP
    }
}

for i in 0..<n {
    let xy = readLine()!.split(separator: " ").map { Double($0)! }
    stars.append((x: xy[0], y: xy[1]))
    for j in 0..<i {
        distances.append((a: i, b: j, cost: getCost(stars[i], stars[j])))
    }
}
distances.sort { $0.cost < $1.cost }

var result = 0.0
for distance in distances {
    let aP = find(distance.a)
    let bP = find(distance.b)
    
    if aP != bP {
        result += distance.cost
        union(aP, bP)
    }
}
print(result)
