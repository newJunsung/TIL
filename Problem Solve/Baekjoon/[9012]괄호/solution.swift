import Foundation

class Parenthesis {
    var testCase : String
    var check : Int

    init(_ testCase : String) {
        self.check = 0
        self.testCase = testCase
    }

    func vps() -> String {
        for character in testCase {
            if check <= -1 {
                break
            }

            character == "(" ? (check += 1) : (check -= 1)
        }

        return check == 0 ? "YES" : "NO";
    }
}

let times = Int(readLine()!)!
var parenthesis = Array<Parenthesis>();

for _ in 0..<times {
    let temp = Parenthesis(readLine()!)
    parenthesis.append(temp)
}

for parenthesis in parenthesis {
    print(parenthesis.vps())
}