let nk = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (nk[0], nk[1])
let quests = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var exp = 0
var stoneCount = 0
for quest in quests {
    if stoneCount < k {
        stoneCount += 1
        exp -= quest
    }
    exp += (quest * stoneCount)
}
print(exp)
