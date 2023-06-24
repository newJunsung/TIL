import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    let dk = Double(k)
    
    var count: Int64 = 0
    var x = 0
    while x * k <= d {
        let temp = x * k
        let y = sqrt(Double(d * d - temp * temp))
        count += Int64(floor(y / dk) + 1)
        x += 1
    }
    return count
}
