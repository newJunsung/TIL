let n = Int(readLine()!)!
let halfN = n / 2

var teamStat = [[Int]]()
for _ in 0..<n {
    let s = readLine()!.split(separator: " ").map { Int($0)! }
    teamStat.append(s)
}

var result = Int.max
var isSelected = [Bool](repeating: false, count: n)
func dfs(playerNumber: Int, depth: Int) {
    if depth == n / 2 {
        var startTeam = [Int]()
        var linkTeam = [Int]()
        for number in 0..<n {
            if isSelected[number] {
                startTeam.append(number)
            } else {
                linkTeam.append(number)
            }
        }
        
        var startScore = 0
        var linkScore = 0
        for i in 0..<(halfN - 1) {
            for j in (i + 1)..<(halfN) {
                startScore += (teamStat[startTeam[i]][startTeam[j]] + teamStat[startTeam[j]][startTeam[i]])
                linkScore += (teamStat[linkTeam[i]][linkTeam[j]] + teamStat[linkTeam[j]][linkTeam[i]])
            }
        }
        result = min(result, abs(startScore - linkScore))
    } else {
        for newNumber in playerNumber..<n where !isSelected[newNumber] {
            isSelected[newNumber] = true
            dfs(playerNumber: newNumber, depth: depth + 1)
            isSelected[newNumber] = false
        }
    }
}
for i in 0..<n {
    isSelected[i] = true
    dfs(playerNumber: i, depth: 1)
    isSelected[i] = false
}
print(result)
