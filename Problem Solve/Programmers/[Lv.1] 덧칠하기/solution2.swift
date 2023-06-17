import Foundation

func solution(_ n:Int, _ m:Int, _ section:[Int]) -> Int {
    var count = 0
    
    var now = 0
    for sec in section {
        if sec >= now {
            count += 1
            now = sec + m
        }
    }
    
    return count
}
