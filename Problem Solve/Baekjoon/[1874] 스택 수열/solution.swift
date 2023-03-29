let n = Int(readLine()!)!

var answer = ""
var index = 0
var lastNum = 0

var arr = [Int](repeating: 0, count: n)
var arr2 = [Int]()


for i in 0..<n {
    arr[i] = Int(readLine()!)!
}

for a in arr {
    if index > n {
        answer = "NO"
        break
    }
    
    if a > lastNum {
        while index != a {
            index += 1
            
            if index > n {
                break
            }
            
            arr2.append(index)
            answer += "+\n"
        }
        
        lastNum = arr2.popLast()!
        answer += "-\n"
    } else {
        let num = arr2.popLast()!
        
        if num != a {
            answer = "NO"
            break
        } else {
            answer += "-\n"
            lastNum = num
        }
    }
}

if answer != "NO" {
    answer.popLast()
}

print(answer)
