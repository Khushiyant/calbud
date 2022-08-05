# Force Cast

Force casts should be avoided.

* **Identifier:** force_cast
* **Enabled by default:** Yes
* **Supports autocorrection:** No
* **Kind:** idiomatic
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.0.0
* **Default configuration:** error

## Non Triggering Examples

```swift
NSNumber() as? Int

```

## Triggering Examples

```swift
NSNumber() ↓as! Int

```