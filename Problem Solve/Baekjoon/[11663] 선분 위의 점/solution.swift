let nm = readLine()!.split(separator: " ").map { Int($0)! }
let arr = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var str = ""
for _ in 0..<nm[1] {
    let info = readLine()!.split(separator: " ").map { Int($0)! }
    let start = binSearch(num: info[0], arr: arr)
    let end = binSearch(num: info[1] + 1, arr: arr)
    str += "\(end - start)\n"
}
print(str)

func binSearch(num: Int, arr: [Int]) -> Int {
    var start = 0
    var end = arr.count - 1
    while start <= end {
        let mid = (end + start) / 2
        if arr[mid] >= num {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    return end
}
