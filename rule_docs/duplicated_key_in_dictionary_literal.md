# Duplicated Key in Dictionary Literal

Dictionary literals with duplicated keys will crash in runtime.

* **Identifier:** duplicated_key_in_dictionary_literal
* **Enabled by default:** Yes
* **Supports autocorrection:** No
* **Kind:** lint
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.0.0
* **Default configuration:** warning

## Non Triggering Examples

```swift
    [
        1: "1",
        2: "2"
    ]
```

```swift
    [
        "1": 1,
        "2": 2
    ]
```

```swift
    [
        foo: "1",
        bar: "2"
    ]
```

## Triggering Examples

```swift
    [
        1: "1",
        2: "2",
        ↓1: "one"
    ]
```

```swift
    [
        "1": 1,
        "2": 2,
        ↓"2": 2
    ]
```

```swift
    [
        foo: "1",
        bar: "2",
        baz: "3",
        ↓foo: "4",
        zaz: "5"
    ]
```

```swift
    [
        .one: "1",
        .two: "2",
        .three: "3",
        ↓.one: "1",
        .four: "4",
        .five: "5"
    ]
```