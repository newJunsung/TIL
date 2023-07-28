let inp = readLine()!.split(separator: " " ).map{Int(String($0))!}
let N = inp[0], K = inp[1], M = inp[2]
var list = [Int]()
for _ in 0..<N {
    let q = Int(readLine()!)!
    if q >= K {
        if q > 2*K {
            list.append(q-(2*K))
        } else if q < 2*K{
            list.append(q-K)
        }
    }
}

var l = 1, r = list.max() ?? 0

while l<=r {
    let mid = (l+r)/2
    var sum = 0
    list.forEach{
        sum += $0/mid
    }
    if sum >= M {
        l = mid+1
    } else {
        r = mid-1
    }
}

print(r == 0 ? -1 : r)

