let nr = readLine()!.split(separator: " ").map { Int($0)! }
let (n, r) = (nr[0], nr[1])

var infos = [[(cost: Int, count: Int)]](repeating: [(cost: Int, count: Int)](repeating: (cost: 18_200_000, count: 1), count: n), count: n)
for i in 0..<n {
    infos[i][i].cost = 0
}
for _ in 0..<r {
    let str = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b, c, d, e) = (str[0] - 1, str[1] - 1, str[2], str[3], str[4])
    var cost = c
    if e - 10 > 0 {
        cost += (e - 10) * d
    }
    infos[a][b].cost = min(infos[a][b].cost, cost)
}
for i in 0..<n {
    for j in 0..<n {
        for k in 0..<n {
            let newCost = infos[j][i].cost + infos[i][k].cost
            let newCount = infos[j][i].count + infos[i][k].count
            if infos[j][k].cost > newCost {
                infos[j][k] = (newCost, newCount)
            } else if infos[j][k].cost == newCost {
                infos[j][k].count = min(infos[j][k].count, newCount)
            }
        }
    }
}
if infos[0][n - 1].cost < 1_820_000 {
    print("\(infos[0][n - 1].cost) \(infos[0][n - 1].count + 1)")
} else {
    print("It is not a great way.")
}
