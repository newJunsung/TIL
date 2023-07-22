let nm = readLine()!.split(separator: " ").map { Int($0)! }
var arr = [0] + readLine()!.split(separator: " ").map { Int($0)! }
for i in 1...nm[0] {
    arr[i] = arr[i] + arr[i - 1]
}

var salary = arr[nm[1]]
for i in nm[1]...nm[0] {
    salary = max(salary, arr[i] - arr[i - nm[1]])
}
print(salary)
