[공식문서](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/accesscontrol/)

# 접근제어자 

접근제어자는 우리가 작성한 코드가 다른 파일 또는 모듈에서 접근하는 것을 제한하도록 도와줍니다.

## 접근제어자를 사용할 수 있는 키워드
- Individual types: `class`, `struct`, `enum`
    - Propertios: `let`, `var`
    - Methods
    - Initializers: `designated`, `convinience`
    - Subscripts
- Protocols
- Global constants
- Variables
- Functions

> 다양한 접근제어자를 제공하는데, 스위프트는 일반적인 상황에서 기본 접근 레벨을 제공해줘서 명시적으로 접근 레벨을 명시할 필요를 줄여줍니다.

## 모듈과 소스 파일
접근 제어자를 알아보기 전에, 모듈과 소스 파일을 이해해야 합니다.

### 모듈
모듈은 코드 배포의 단일 유닛입니다.

(ex. 프레임워크나 어플리케이션, `import` 키워드 뒤에 붙는 단어가 모듈입니다.)

프로젝트를 하며 자주 import했던 `Foundation`, `SwifUI`, `UIKit` 등도 모듈입니다.

### 소스 파일
모듈 안에 있는 소스 코드가 적힌 각각의 파일을 의미합니다.

하나의 소스파일에 하나의 Invidiual type을 넣는 경우가 많지만, 한 파일에 복수 개의 type이 들어가도 소스 파일은 1개입니다.

## 제어 레벨
`open` > `public` > `internal` > `fileprivate` > `private`

제어 레벨의 접근성 입니다. `open` 이 제일 개방적이고 `private` 가 제일 폐쇠적입니다.

### Open과 public
두 제어 레벨을 사용한 함수, 프로퍼티는 모두 `import` 를 통해 선언을 한 곳이라면 어느 소스 파일에서든 쓰일 수 있습니다.
보통 프레임워크에 pubilc interface를 정의할 때 사용합니다.
- open: `open`은 오직 클래스와 클래스 멤버들에게만 적용할 수 있습니다. `open`을 사용하면, 외부 모듈에서 상속과 오버라이딩을 할 수 있습니다.

### Internal
`internal`은 어느 소스파일에서든 접근할 수 있지만, 외부 모듈에서는 접근할 수가 없습니다.

`internal`은 Swift 접근 제어자의 기본값입니다. 따라서 접근제어자를 선언하지 않았다면, `internal`로 적용됩니다.

### File-private
`fileprivate`는 소스파일 내부에서만 사용할 수 있습니다. 

당연한 말이겠지만, 파일 외부에서 `extension`을 사용하면 에러가 나옵니다.

### private
`private`를 사용하면 그 기능을 정의하고 구현한 범위 안에서 쓸 수 있다.

`fileprivate`와 마찬가지로 파일 외부에서 `extension`을 사용하면 에러가 나옵니다.

## 제어 레벨의 가이드 원칙
- 가장 밖의(둘러싼) 접근지정자보다 넓은 지정자를 쓰는 것은 지양해야 합니다.
- 함수는 주변 코드에서 구성 타입을 사용할 수 없는 상황에서 함수를 사용할 수 있기 때문에 파라미터 타입과 반환 타입보다 더 높은 접근 수준을 가질 수 없습니다.