import Foundation

struct Heap<T : Comparable> {
    var elements : [T]
    let sortFunction : (T, T) -> Bool
    
    init(sortFunction : @escaping(T, T) -> Bool) {
        self.sortFunction = sortFunction
        elements = Array<T>()
    }
    
    mutating func parent(of index : Int) -> Int {
        return index / 2
    }
    mutating func leftChild(of index : Int) -> Int {
        return index * 2
    }
    mutating func rightChild(of index : Int) -> Int {
        return index * 2 + 1
    }
    mutating func insert(_ element : T) {
        if elements.isEmpty {
            elements.append(element)
            elements.append(element)
            return
        }
        
        elements.append(element)
        var index = elements.count - 1
        
        while (index != 1) && sortFunction(elements[index], elements[parent(of: index)]) {
            elements.swapAt(index, parent(of: index))
            index = parent(of: index)
        }
    }
    
    mutating func pop() -> T? {
        if elements.count <= 1 { return nil }
        
        elements.swapAt(1, elements.count - 1)
        let element = elements.removeLast()
        moveDown(from: 1)
        
        return element
    }
    
    mutating func moveDown(from index : Int) {
        let leftChildIndex = leftChild(of: index)
        let rightChildIndex = rightChild(of: index)
        var childIndex = index
        
        if leftChildIndex < elements.endIndex && sortFunction(elements[leftChildIndex], elements[childIndex]) {
            childIndex = leftChildIndex
        }
        if rightChildIndex < elements.endIndex && sortFunction(elements[rightChildIndex], elements[childIndex]) {
            childIndex = rightChildIndex
        }
        if childIndex != index {
            elements.swapAt(index, childIndex)
            moveDown(from: childIndex)
        }
    }
}

var answer = ""
var heap = Heap<Int>(sortFunction: <)
let n = Int(readLine()!)!

for _ in 0 ..< n {
    let num = Int(readLine()!)!
    
    switch num {
    case 0:
        if let num = heap.pop() { answer += "\(num)\n" }
        else { answer += "0\n" }
    default:
        heap.insert(num)
    }
}

print(answer)
