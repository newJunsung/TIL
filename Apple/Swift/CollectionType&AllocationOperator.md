# Swift로 PS할 때 주의할 점(COW)

# 결과는 같은데 왜 5배 이상 차이가 나지?

![Untitled](Swift%E1%84%85%E1%85%A9%20PS%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%84%E1%85%A2%20%E1%84%8C%E1%85%AE%E1%84%8B%E1%85%B4%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%8C%E1%85%A5%E1%86%B7(COW)%20051edf4bb5a245228bfa7ecc11d968ca/Untitled.png)

백준 문제를 제출하고 정답이 나온다면, 걸린 시간을 확인할 수 있다.

아래와 위의 코드 차이는 한 줄 차이밖에 나지 않는다. 나머지 코드는 동일하다.

**아래 코드의 일부(652 ms)**

```swift
let divider = 1_000_000_007
let my1 = [-1, 0, 1]
let mx1 = [1, 1, 0]
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var hive = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
// ...
for x in 0..<m {
    for y in 0..<n {
		    for i in 0..<3 {
		        let newX = x + mx[i]
            let newY = y + my[i]
						hive[newY][newX] += hive[y][x]
						hive[newY][newX] %= divider
				}
		}
}
// ...
```

**위 코드의 일부(124 ms)**

```swift

let divider = 1_000_000_007
let my1 = [-1, 0, 1]
let mx1 = [1, 1, 0]
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (nm[0], nm[1])

var hive = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
// ...
for x in 0..<m {
    for y in 0..<n {
		    for i in 0..<3 {
		        let newX = x + mx[i]
            let newY = y + my[i]
						hive[newY][newX] = (hive[newY][newX] + hive[y][x]) % divider
				}
		}
}
// ...
```

코드는 다르지만, 결과는 동일하다는 것을 코딩을 한 사람들은 알 것이다.

그럼에도 불구하고 시간이 5배 차이가 나는 이유는 무엇일까?

이번에 블로그에 처음으로 쓸 글은 백준 온라인 저지에서만 일어나는 문제(ex. 입출력으로 인한 시간초과)가 아닌 Swift로 PS할 때 전반적으로 주의해야 할 점에 대해 남기고자 한다.

우선 COW에 대해 알아보도록 하자.

# COW란? (Copy On Write)

아래의 코드를 확인해보면, h2가 h1을 통해 복제가 되고 있는 것을 확인할 수 있다.

```swift
struct Human {
	var age: Int
	var name: String
}

let h1 = Human(age: 20, name: "H1")
var h2 = h1
```

`let h1 = Human(age: 20, name: "H1")` 코드가 실행되고 난 이후의 메모리 상황은 일단 아래와 같을 것이다.

![Untitled](Swift%E1%84%85%E1%85%A9%20PS%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%84%E1%85%A2%20%E1%84%8C%E1%85%AE%E1%84%8B%E1%85%B4%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%8C%E1%85%A5%E1%86%B7(COW)%20051edf4bb5a245228bfa7ecc11d968ca/Untitled%201.png)

그리고 `var h2 = h1` 코드를 실행하면, COW에 대해 모르는 사람들은 아래와 같은 상황이 될 것이라고 생각하는 경우가 많을 것이다.

![Untitled](Swift%E1%84%85%E1%85%A9%20PS%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%84%E1%85%A2%20%E1%84%8C%E1%85%AE%E1%84%8B%E1%85%B4%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%8C%E1%85%A5%E1%86%B7(COW)%20051edf4bb5a245228bfa7ecc11d968ca/Untitled%202.png)

그러나 사실 이렇지 않다.

변수에 값을 복제할 때, 새로운 값을 만들어 메모리에 할당하는 것이 아닌 원본 값을 참조한다.

그림으로 보면 아래와 같은 상황이 일어난다는 것이다.

![Untitled](Swift%E1%84%85%E1%85%A9%20PS%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%84%E1%85%A2%20%E1%84%8C%E1%85%AE%E1%84%8B%E1%85%B4%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%8C%E1%85%A5%E1%86%B7(COW)%20051edf4bb5a245228bfa7ecc11d968ca/Untitled%203.png)

그렇다면 `h2`의 `age` 혹은 `name`이 바뀌게 되면 h1의 값이 바뀐다고 생각하는 사람이 있을 수도 있다.

물론 `h1`은 상수라 값이 바뀌지 않고, 바뀌면 안된다.

```swift
struct Human {
	var age: Int
	var name: String
}

let h1 = Human(age: 20, name: "H1")
var h2 = h1
h2.name = "H2"
h2.age = 58
```

이 경우에는 h2의 값이 바뀌기 때문에 이 시점에서 메모리를 새로 할당한다.

![Untitled](Swift%E1%84%85%E1%85%A9%20PS%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%84%E1%85%A2%20%E1%84%8C%E1%85%AE%E1%84%8B%E1%85%B4%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%8C%E1%85%A5%E1%86%B7(COW)%20051edf4bb5a245228bfa7ecc11d968ca/Untitled%204.png)

이러한 과정을 **COW(Copy On Write)**라고 한다.

**COW**를 어디에서 사용하는 것이고 왜 사용할까?라는 질문에는 프로세스 생성을 예로 들 수 있다.

`fork()`를 통해 새로 프로세스를 만든다고 가정했을 때, **COW**를 하지 않는다면 새로 프로세스를 만들어야 하기 때문에, 오버헤드가 커진다.

따라서 값에 수정이 있기까지 부모 프로세스의 주소를 자식 프로세스가 가리키고 있다면, 프로세서를 생성하는 과정에서의 오버헤드를 않이 줄일 수 있기 때문에, **COW**를 사용한다고 한다.

# Swift에서의 COW

*‘Swift와 COW가 그래서 무슨 상관인데?’*에 대한 답변을 할 차례다.

컬렉션 타입(배열, 딕셔너리, 문자열 등)의 경우 구조체임에도 불구하고 힙 영역에 할당이 된다.

(물론 상수일 경우에는 스택에 할당되는 것으로 알고 있다.)

왜나하면 컬렉션 타입의 경우, 사이즈가 가변적이기 때문에 스택에 정해진 크기만큼 할당할 수 없기 때문이다.

아래와 같은 코드가 있다고 해보자.

```swift
var a = [1, 2, 3, 4] // Line 1
var b = a // Line 2
b.append(5) // Line 3
```

1번 째 줄을 실행하면 메모리(힙)에 아래와 같이 저장이 될 것이다. (참고. 변수 a는 스택 메모리에 있다.)

![Untitled](Swift%E1%84%85%E1%85%A9%20PS%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%84%E1%85%A2%20%E1%84%8C%E1%85%AE%E1%84%8B%E1%85%B4%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%8C%E1%85%A5%E1%86%B7(COW)%20051edf4bb5a245228bfa7ecc11d968ca/Untitled%205.png)

앞서 배운 COW 개념을 적용했을 때, 2 번째 줄을 실행하면 아래와 같은 상황이 된다.

![Untitled](Swift%E1%84%85%E1%85%A9%20PS%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%84%E1%85%A2%20%E1%84%8C%E1%85%AE%E1%84%8B%E1%85%B4%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%8C%E1%85%A5%E1%86%B7(COW)%20051edf4bb5a245228bfa7ecc11d968ca/Untitled%206.png)

마지막으로 3 번째 줄을 실행하면, b는 새로운 메모리를 할당받으며 초기화가 진행될 것이다.

결국 아래와 같은 상황이 될 것이다.

![Untitled](Swift%E1%84%85%E1%85%A9%20PS%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%84%E1%85%A2%20%E1%84%8C%E1%85%AE%E1%84%8B%E1%85%B4%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%8C%E1%85%A5%E1%86%B7(COW)%20051edf4bb5a245228bfa7ecc11d968ca/Untitled%207.png)

![Untitled](Swift%E1%84%85%E1%85%A9%20PS%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%84%E1%85%A2%20%E1%84%8C%E1%85%AE%E1%84%8B%E1%85%B4%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%8C%E1%85%A5%E1%86%B7(COW)%20051edf4bb5a245228bfa7ecc11d968ca/Untitled%208.png)

## 컬렉션 타입에서 할당 연산 시의 COW (추측)

여기서부터는 추측의 영역이다.

다차원 배열에서 할당 연산(`+=`, `-=`, `*=`, `/=` 등.)을 할 경우의 상황을 살펴보자.

아래의 코드에서 i와 j가 둘 다 0일 때 Line 1 연산을 할 경우, 메모리는 아래와 같은 상황이 될 것 같다.

```swift
var a = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 2)
for i in 0..<(a.count - 1) {
		a[i][0] = 1
    for j in 0..<(a[i].count - 1) {
        a[i][j + 1] += a[i][j] // Line 1
    }
}
```

![Untitled](Swift%E1%84%85%E1%85%A9%20PS%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%84%E1%85%A2%20%E1%84%8C%E1%85%AE%E1%84%8B%E1%85%B4%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%8C%E1%85%A5%E1%86%B7(COW)%20051edf4bb5a245228bfa7ecc11d968ca/Untitled%209.png)

위의 이미지 같은 상황에서 기존의 값을 보유하는 변수를 하나 만들고, 거기서 더하기 연산을 할 것 같다.

그런데 앞서 말했다시피 컬렉션 타입은 힙 영역에 할당되고 COW가 적용되기 때문에 아래와 같은 상황이 될 것이다.

![Untitled](Swift%E1%84%85%E1%85%A9%20PS%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%84%E1%85%A2%20%E1%84%8C%E1%85%AE%E1%84%8B%E1%85%B4%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%8C%E1%85%A5%E1%86%B7(COW)%20051edf4bb5a245228bfa7ecc11d968ca/Untitled%2010.png)

여기서 `a[0][j + 1] = a[0][j + 1] + Temp[j]`이 일어나서 a[0]은 다시 초기화가 진행된다.

![Untitled](Swift%E1%84%85%E1%85%A9%20PS%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%84%E1%85%A2%20%E1%84%8C%E1%85%AE%E1%84%8B%E1%85%B4%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%8C%E1%85%A5%E1%86%B7(COW)%20051edf4bb5a245228bfa7ecc11d968ca/Untitled%2011.png)

마무리로 Temp는 제 역할을 다 했기 때문에 소멸된다는 것이 내 추측이다.

![Untitled](Swift%E1%84%85%E1%85%A9%20PS%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%84%E1%85%A2%20%E1%84%8C%E1%85%AE%E1%84%8B%E1%85%B4%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%8C%E1%85%A5%E1%86%B7(COW)%20051edf4bb5a245228bfa7ecc11d968ca/Untitled%2012.png)

즉, 할당 연산 시에는 매 번 COW로 인한 초기화가 일어난다는게 내 추측이다.

그리고 놀랍게도, 내 추측은 사실이었다.

아래의 코드를 콘솔에서 실행시키고 출력된 결과를 확인하면 메모리 주소가 바뀌는 것을 확인할 수 있다!

### 코드

```swift
func printAddress(of object: UnsafeRawPointer) {
    print(object)
}

var a = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 2)
for i in 0..<(a.count) {
    a[i][0] = 1
    for j in 0..<(a[i].count - 1) {
        a[i][j + 1] += a[i][j]
        print("--a[\(i)]의 배열주소--------")
        printAddress(of: a[i])
        print("----------------------------")
    }
}
```

### 실행 결과

![Untitled](Swift%E1%84%85%E1%85%A9%20PS%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%84%E1%85%A2%20%E1%84%8C%E1%85%AE%E1%84%8B%E1%85%B4%E1%84%92%E1%85%A1%E1%86%AF%20%E1%84%8C%E1%85%A5%E1%86%B7(COW)%20051edf4bb5a245228bfa7ecc11d968ca/Untitled%2013.png)

### 컴파일(뇌피셜)

결론적으로 이 코드를 컴파일하면 아래와 비슷할 것 같다.

```swift
// 컴파일 전
var a = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 2)
for i in 0..<(a.count - 1) {
		a[i][0] = 1
    for j in 0..<(a[i].count - 1) {
        a[i][j + 1] += a[i][j] // Line 1
    }
}
```

```swift
// 컴파일 후
var a = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 2)
for i in 0..<(a.count - 1) {
		a[i][0] = 1
    for j in 0..<(a[i].count - 1) {
        var temp = a[i]
        a[i][j + 1] = a[i][j + 1] + temp[j]
    }
}
```

# 마무리

그럼 할당연산을 하지 않고 어떻게 해결해야 할까? ~~*(Swift로 PS를 안하면 된다.)*~~

내가 내린 결론은 += 연산자 대신 + 연산자를 쓰는 것이다.

아래와 같이 쓰는 것보단,

```swift
var a = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 2)
for i in 0..<(a.count - 1) {
    for j in 0..<(a[i].count - 1) {
        a[i][j + 1] += a[i][j]
    }
}
```

이렇게 쓰는 것을 추천하고 싶다.

```swift
var a = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 2)
for i in 0..<(a.count - 1) {
    for j in 0..<(a[i].count - 1) {
        a[i][j + 1] = a[i][j + 1] + a[i][j]
    }
}
```

마찬가지로, 위 코드를 컴파일하면 이런 결과가 나올 것 같다.

(메모리 주소에서 값을 갈아끼우는 개념으로 생각하면 된다.)

```swift
var a = [[Int]](repeating: [Int](repeating: 0, count: 4), count: 2)
for i in 0..<(a.count - 1) {
    for j in 0..<(a[i].count - 1) {
		    let temp = a[i][j]
        a[i][j + 1] = a[i][j + 1] + temp
    }
}
```

## 참고자료

명품 운영체제 (p.480~484), 황기태, 생능출판사

[Understanding Swift Performance - WWDC16 - Videos - Apple Developer](https://developer.apple.com/videos/play/wwdc2016/416/)