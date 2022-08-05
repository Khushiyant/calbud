# Legacy Objective-C Reference Type

Prefer Swift value types to bridged Objective-C reference types

* **Identifier:** legacy_objc_type
* **Enabled by default:** No
* **Supports autocorrection:** No
* **Kind:** idiomatic
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.0.0
* **Default configuration:** warning

## Non Triggering Examples

```swift
var array = Array<Int>()

```

```swift
var calendar: Calendar? = nil
```

```swift
var formatter: NSDataDetector
```

```swift
var className: String = NSStringFromClass(MyClass.self)
```

## Triggering Examples

```swift
var array = NSArray()
```

```swift
var calendar: NSCalendar? = nil
```