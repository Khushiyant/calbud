# Test case accessibility

Test cases should only contain private non-test members.

* **Identifier:** test_case_accessibility
* **Enabled by default:** No
* **Supports autocorrection:** Yes
* **Kind:** lint
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.0.0
* **Default configuration:** warning, allowed_prefixes: [[]]

## Non Triggering Examples

```swift
let foo: String?

class FooTests: XCTestCase {
    static let allTests: [String] = []

    private let foo: String {
        let nestedMember = "hi"
        return nestedMember
    }

    override static func setUp() {
        super.setUp()
    }

    override func setUp() {
        super.setUp()
    }

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override static func tearDown() {
        super.tearDown()
    }

    override func tearDown() {
        super.tearDown()
    }

    override func tearDownWithError() {
        try super.tearDownWithError()
    }

    override func someFutureXCTestFunction() {
        super.someFutureXCTestFunction()
    }

    func testFoo() {
        XCTAssertTrue(true)
    }

    func testBar() {
        func nestedFunc() {}
    }

    private someFunc(hasParam: Bool) {}
}
```

```swift
class FooTests: XCTestCase {
    func allowedPrefixTestFoo() {}
}
```

```swift
class Foobar {
    func setUp() {}

    func tearDown() {}

    func testFoo() {}
}
```

## Triggering Examples

```swift
class FooTests: XCTestCase {
    ↓var foo: String?
    ↓let bar: String?

    ↓static func foo() {}

    ↓func setUp(withParam: String) {}

    ↓func foobar() {}

    ↓func not_testBar() {}

    ↓enum Nested {}

    ↓static func testFoo() {}

    ↓static func allTests() {}

    ↓func testFoo(hasParam: Bool) {}
}

final class BarTests: XCTestCase {
    ↓class Nested {}
}
```