let s = readLine()!
let t = readLine()!

let a = s.count >= t.count ? s : t
let b = s.count < t.count ? s : t

func gcd(_ a: Int, _ b: Int) -> Int {
    var r = 0
    var a = a
    var b = b
    
    while b != 0 {
        r = a % b
        a = b
        b = r
    }
    
    return a
}

func lcm(_ a: Int, _ b: Int) -> Int {
    (a * b) / gcd(a, b)
}

let lcmVal = lcm(a.count, b.count)
let aDiv = lcmVal / a.count
let bDiv = lcmVal / b.count

print(String(repeating: a, count: aDiv) == String(repeating: b, count: bDiv) ? 1 : 0)
