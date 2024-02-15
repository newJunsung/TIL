import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }

        return buffer.withUnsafeBufferPointer { $0[index] }
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }

    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()

        while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시

        while now != 10
            && now != 32 && now != 0 {
                str += String(bytes: [now], encoding: .ascii)!
                now = read()
        }

        return str
    }
}

let file = FileIO()
let N = file.readInt()
let M = file.readInt()

var array = [[Int]]()
for _ in 0..<M {
    let x1 = file.readInt()
    let x2 = file.readInt()
    let cost = file.readInt()
    array.append([x1,x2,cost])
}

var costs = 0
var maxCost = 0
var parent = Array(0...N)

func union(_ x : Int , _ y : Int ) {
    let parentA = find(x)
    let parentB = find(y)
    
    parent[parentB] = parentA
}

func find(_ x : Int ) -> Int {
    if parent[x] == x { return x }
    else { parent[x] = find(parent[x])}
    return parent[x]
}

array.sort(by : {$0[2] < $1[2]})

for node in array {
    let pX = find(node[0]), pY = find(node[1])
    if pX != pY {
        union(node[0], node[1])
        costs += node[2]
        maxCost = max(maxCost,node[2])
    }
}

print(costs - maxCost)
