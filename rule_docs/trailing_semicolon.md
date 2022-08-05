# Trailing Semicolon

Lines should not have trailing semicolons.

* **Identifier:** trailing_semicolon
* **Enabled by default:** Yes
* **Supports autocorrection:** Yes
* **Kind:** idiomatic
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.0.0
* **Default configuration:** warning

## Non Triggering Examples

```swift
let a = 0

```

```swift
let a = 0; let b = 0
```

## Triggering Examples

```swift
let a = 0↓;

```

```swift
let a = 0↓;
let b = 1

```