import Foundation

let n = Int(readLine()!)!

var arr = [Int](repeating: 1_000_000, count: 1_000_000 + 1)
arr[0] = 0
arr[1] = 0
arr[2] = 1;
arr[3] = 1;

for i in 4...(1_000_000) {
    if i % 2 == 0 {
        arr[i] = min(arr[i], arr[i / 2] + 1)
    }
    
    if i % 3 == 0 {
        arr[i] = min(arr[i], arr[i / 3] + 1)
    }
    
    arr[i] = min(arr[i], arr[i - 1] + 1)
}

print(arr[n])
