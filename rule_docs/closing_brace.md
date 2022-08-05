# Closing Brace Spacing

Closing brace with closing parenthesis should not have any whitespaces in the middle.

* **Identifier:** closing_brace
* **Enabled by default:** Yes
* **Supports autocorrection:** Yes
* **Kind:** style
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.0.0
* **Default configuration:** warning

## Non Triggering Examples

```swift
[].map({ })
```

```swift
[].map(
  { }
)
```

## Triggering Examples

```swift
[].map({ ↓} )
```

```swift
[].map({ ↓}	)
```