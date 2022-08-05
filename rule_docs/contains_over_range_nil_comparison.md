# Contains over range(of:) comparison to nil

Prefer `contains` over `range(of:) != nil` and `range(of:) == nil`.

* **Identifier:** contains_over_range_nil_comparison
* **Enabled by default:** No
* **Supports autocorrection:** No
* **Kind:** performance
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.0.0
* **Default configuration:** warning

## Non Triggering Examples

```swift
let range = myString.range(of: "Test")
```

```swift
myString.contains("Test")
```

```swift
!myString.contains("Test")
```

```swift
resourceString.range(of: rule.regex, options: .regularExpression) != nil
```

## Triggering Examples

```swift
↓myString.range(of: "Test") != nil
```

```swift
↓myString.range(of: "Test") == nil
```