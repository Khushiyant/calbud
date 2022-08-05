# IBInspectable in Extension

Extensions shouldn't add @IBInspectable properties.

* **Identifier:** ibinspectable_in_extension
* **Enabled by default:** No
* **Supports autocorrection:** No
* **Kind:** lint
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.0.0
* **Default configuration:** warning

## Non Triggering Examples

```swift
class Foo {
  @IBInspectable private var x: Int
}
```

## Triggering Examples

```swift
extension Foo {
  @IBInspectable private var x: Int
}
```