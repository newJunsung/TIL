import Foundation

struct Queue<T> {
    private var input = [T]()
    private var output = [T]()

    var isEmpty: Bool {
        return input.isEmpty && output.isEmpty
    }

    mutating func enqueue(_ element: T) {
        input.append(element)
    }

    mutating func dequeue() -> T? {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }

        return output.popLast()
    }
}

func bfs(graph: inout [[Bool]], start: [Int], end: [Int], size: Int) -> Int {
    var queue = Queue<[Int]>()
    queue.enqueue([start[0], start[1], 0])

    while !queue.isEmpty {
        let info = queue.dequeue()!
        if info[0] == end[0] && info[1] == end[1] {
            return info[2]
        }
        
        let move = [
            (info[0] - 2, info[1] - 1),
            (info[0] - 2, info[1] + 1),
            (info[0] + 2, info[1] - 1),
            (info[0] + 2, info[1] + 1),
            (info[0] - 1, info[1] - 2),
            (info[0] + 1, info[1] - 2),
            (info[0] - 1, info[1] + 2),
            (info[0] + 1, info[1] + 2)
        ]

        for mv in move {
            if mv.0 < 0 || mv.0 >= size || mv.1 < 0 || mv.1 >= size {
                continue
            }

            if !graph[mv.0][mv.1] {
                queue.enqueue([mv.0, mv.1, info[2] + 1])
                graph[mv.0][mv.1] = true
            }
        }
    }

    return 0
}

let tc = Int(readLine()!)!

for _ in 0..<tc {
    let size = Int(readLine()!)!
    var chess = [[Bool]](
        repeating: [Bool](repeating: false, count: size),
        count: size
    )

    let start = readLine()!.split(separator: " ").map { Int($0)! }
    let end = readLine()!.split(separator: " ").map { Int($0)! }
    chess[start[0]][start[1]] = true

    print(bfs(graph: &chess, start: start, end: end, size: size))
}
