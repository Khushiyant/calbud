# Vertical Whitespace before Closing Braces

Don't include vertical whitespace (empty line) before closing braces.

* **Identifier:** vertical_whitespace_closing_braces
* **Enabled by default:** No
* **Supports autocorrection:** Yes
* **Kind:** style
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.0.0
* **Default configuration:** N/A

## Non Triggering Examples

```swift
/*
    class X {

        let x = 5

    }
*/
```

```swift
[
1,
2,
3
]
```

```swift
[1, 2].map { $0 }.filter { num in true }
```

```swift
[1, 2].map { $0 }.filter { true }
```

```swift
do {
  print("x is 5")
}
```

```swift
do {
  print("x is 5")
}
```

```swift
do {
  print("x is 5")
}
```

```swift
foo(
    x: 5,
    y:6
)
```

```swift
func foo() {
  run(5) { x in
    print(x)
  }
}
```

## Triggering Examples

```swift
[
1,
2,
3
↓
]
```

```swift
do {
  print("x is 5")
↓

}
```

```swift
do {
  print("x is 5")
↓
  
}
```

```swift
do {
  print("x is 5")
↓
}
```

```swift
foo(
    x: 5,
    y:6
↓
)
```

```swift
func foo() {
  run(5) { x in
    print(x)
  }
↓
}
```