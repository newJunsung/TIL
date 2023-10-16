//
//  main.swift
//  SwiftProblemSolve
//
//  Created by 김준성 on 2023/09/25.
//

import Foundation

final class SwiftProblemSolve {}

let n = Int(readLine()!)!

var meetingTimes = [(start: Int, end: Int)]()

for _ in 0..<n {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    meetingTimes.append((start: info[0], end: info[1]))
}

meetingTimes.sort { (lhs, rhs) in
    if lhs.end != rhs.end {
        return lhs.end < rhs.end
    } else {
        return lhs.start < rhs.start
    }
}

var previousMeeting = (start: -1, end: -1)
var count = 0

for meetingTime in meetingTimes {
    if meetingTime.start >= previousMeeting.end {
        count += 1
        previousMeeting = meetingTime
    }
}

print(count)
