var stacks = [[Int]](repeating: [], count: 4)
var result = "YES"

let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").map { Int($0)! }
for num in nums {
    for i in 0..<4 {
        guard let top = stacks[i].last else {
            stacks[i].append(num)
            break
        }
        
        if top < num {
            stacks[i].append(num)
            break
        }
        
        if i == 3 {
            result = "NO"
        }
    }
    
    if result == "NO" {
        break
    }
}

print(result)
