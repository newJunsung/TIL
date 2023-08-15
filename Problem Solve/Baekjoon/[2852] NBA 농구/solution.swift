import Foundation

let n = Int(readLine()!)!
let endTime = 48 * 60
var scoreBoard = [(team: Int, time: Int)]()
for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map { String($0) }
    let time = info[1].split(separator: ":").map { Int($0)! }
    scoreBoard.append((team: Int(info[0])!, time: time[0] * 60 + time[1]))
}

var team1Time = 0
var team1Score = 0

var team2Time = 0
var team2Score = 0

for i in 0..<n {
    if scoreBoard[i].team == 1 {
        team1Score += 1
    } else {
        team2Score += 1
    }
    
    if team1Score > team2Score {
        if i + 1 >= n {
            team1Time += (endTime - scoreBoard[i].time)
        } else {
            team1Time += (scoreBoard[i + 1].time - scoreBoard[i].time)
        }
    } else if team2Score > team1Score {
        if i + 1 >= n {
            team2Time += (endTime - scoreBoard[i].time)
        } else {
            team2Time += (scoreBoard[i + 1].time - scoreBoard[i].time)
        }
    }
}

var result = """
\(String(format: "%02d", team1Time / 60)):\(String(format: "%02d", team1Time % 60))
\(String(format: "%02d", team2Time / 60)):\(String(format: "%02d", team2Time % 60))
"""
print(result)
