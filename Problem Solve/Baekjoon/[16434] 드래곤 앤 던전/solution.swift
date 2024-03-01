typealias HeroInfo = (atk: Int, maxHP: Int, currentHP: Int)
typealias RoomInfo = (type: Int, atk: Int, hp: Int)

func battle(_ hero: HeroInfo, against room: RoomInfo) -> HeroInfo {
    let tempCount = room.hp / hero.atk
    let turnCount = room.hp % hero.atk == 0 ? tempCount - 1 : tempCount
    
    let newHP = hero.currentHP - room.atk * turnCount
    return (hero.atk, hero.maxHP, newHP)
}

func potion(_ hero: HeroInfo, to room: RoomInfo) -> HeroInfo {
    let newHP = min(hero.maxHP, room.hp + hero.currentHP)
    return (hero.atk + room.atk, hero.maxHP, newHP)
}

let nh = readLine()!.split(separator: " ").map { Int($0)! }
let (n, hATK) = (nh[0], nh[1])

var roomInfos = [RoomInfo]()
for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    roomInfos.append((info[0], info[1], info[2]))
}

var left = 1
var right = Int.max - 1
while left <= right {
    let mid = (left + right) / 2
    
    var hero = HeroInfo(hATK, mid, mid)
    for roomInfo in roomInfos {
        if roomInfo.type == 1 {
            hero = battle(hero, against: roomInfo)
        } else {
            hero = potion(hero, to: roomInfo)
        }
        
        if hero.currentHP <= 0 {
            break
        }
    }
    
    if hero.currentHP <= 0 {
        left = mid + 1
    } else {
        right = mid - 1
    }
}
print(left)

