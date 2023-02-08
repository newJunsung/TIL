import Foundation

func solution(_ num:Int, _ total:Int) -> [Int] {
    if num == 1 {
        return [total]
    }
    
    var array: [Int] = []
    let range = Int(ceil(Float(num/2)))
    
    if num.isMultiple(of: 2) {
        for i in -range...(range - 1) {
            array.append(i)
        }
    } else {
        for i in -range...range {
            array.append(i)
        }
    }
    
    while true {
        let sum = array.reduce(0, +)

        if sum == total {
            return array
        }

        array.remove(at: 0)
        array.append(array.max()! + 1)
    }
}

