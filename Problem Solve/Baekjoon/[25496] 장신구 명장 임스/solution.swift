let pn = readLine()!.split(separator: " ").map { Int($0)! }
let a = readLine()!.split(separator: " ").map { Int($0)! }.sorted()

var p = pn[0], n = 0, count = 0
while p < 200 && n < pn[1] {
    p += a[n]
    n += 1
    count += 1
}
print(count)
