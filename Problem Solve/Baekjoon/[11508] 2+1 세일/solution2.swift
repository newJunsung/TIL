// 숏코딩 버전
let n=Int(readLine()!)!
var c=[Int]()
for _ in 0..<n{c.append(Int(readLine()!)!)}
c.sort(by: >)
var i=0
var r=0
c.forEach{if i != 2{i+=1;r+=$0}else{i=0}}
print(r)
