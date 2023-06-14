import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    var pg = park.map { $0.map { String($0) } }
    var dog = [0, 0]
    let y = pg.count
    let x = pg[0].count
    
    for i in 0..<y {
        for j in 0..<x {
            if pg[i][j] == "S" {
                pg[i][j] = "O"
                dog = [i, j]
                break
            }
        }
    }
    
    for r in routes {
        var temp = Array(r)
        switch String(temp[0]) {
            case "N" :
            let my = dog[0] - Int(String(temp[2]))!
            if (0..<y).contains(my) {
                var count = 0
                for m in my...(dog[0] - 1) {
                    if pg[m][dog[1]] == "X" {
                        count = 0
                        break
                    } else {
                        count -= 1
                    }
                }
                dog[0] += count
            } else {
                continue
            }
            case "S" :
            let my = dog[0] + Int(String(temp[2]))!
            if (0..<y).contains(my) {
                var count = 0
                for m in (dog[0] + 1)...my {
                    if pg[m][dog[1]] == "X" {
                        count = 0
                        break
                    } else {
                        count += 1
                    }
                }
                dog[0] += count
            } else {
                continue
            }
            case "W" :
            let mx = dog[1] - Int(String(temp[2]))!
            if (0..<x).contains(mx) {
                var count = 0
                for m in mx...(dog[1] - 1) {
                    if pg[dog[0]][m] == "X" {
                        count = 0
                        break
                    } else {
                        count -= 1
                    }
                }
                dog[1] += count
            } else {
                continue
            }
            default :
            let mx = dog[1] + Int(String(temp[2]))!
            if (0..<x).contains(mx) {
                var count = 0
                for m in (dog[1] + 1)...mx {
                    if pg[dog[0]][m] == "X" {
                        count = 0
                        break
                    } else {
                        count += 1
                    }
                }
                dog[1] += count
            } else {
                continue
            }
        }
    }
    
    return dog
}
