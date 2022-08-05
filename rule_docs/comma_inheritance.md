# Comma Inheritance Rule

Use commas to separate types in inheritance lists

* **Identifier:** comma_inheritance
* **Enabled by default:** Yes
* **Supports autocorrection:** Yes
* **Kind:** style
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.0.0
* **Default configuration:** warning

## Non Triggering Examples

```swift
struct A: Codable, Equatable {}
```

```swift
enum B: Codable, Equatable {}
```

```swift
class C: Codable, Equatable {}
```

```swift
protocol D: Codable, Equatable {}
```

```swift
typealias E = Equatable & Codable
```

```swift
func foo<T: Equatable & Codable>(_ param: T) {}
```

```swift
protocol G {
    associatedtype Model: Codable, Equatable
}
```

## Triggering Examples

```swift
struct A: Codable↓ & Equatable {}
```

```swift
struct A: Codable↓  & Equatable {}
```

```swift
struct A: Codable↓&Equatable {}
```

```swift
struct A: Codable↓& Equatable {}
```

```swift
enum B: Codable↓ & Equatable {}
```

```swift
class C: Codable↓ & Equatable {}
```

```swift
protocol D: Codable↓ & Equatable {}
```

```swift
protocol G {
    associatedtype Model: Codable↓ & Equatable
}
```