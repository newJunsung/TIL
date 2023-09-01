let nk = readLine()!.split(separator: " ").map { Int64($0)! }
let (n, k) = (nk[0], nk[1])

var l: Int64 = 0
var r: Int64 = n
var count: Int64 = 0 // (r+1) * (c+1) -> 종이 쪼가리 갯수
while l < r {
    let row = (l + r) / 2
    let col = n - row
    count = (row + 1) * (col + 1)
    if count < k {
        l = row + 1
    } else {
        r = row
    }
}
count = (r + 1) * (n - r + 1)
print(count == k ? "YES" : "NO")
