# Todo

TODOs and FIXMEs should be resolved.

* **Identifier:** todo
* **Enabled by default:** Yes
* **Supports autocorrection:** No
* **Kind:** lint
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.0.0
* **Default configuration:** warning

## Non Triggering Examples

```swift
// notaTODO:

```

```swift
// notaFIXME:

```

## Triggering Examples

```swift
// ↓TODO:

```

```swift
// ↓FIXME:

```

```swift
// ↓TODO(note)

```

```swift
// ↓FIXME(note)

```

```swift
/* ↓FIXME: */

```

```swift
/* ↓TODO: */

```

```swift
/** ↓FIXME: */

```

```swift
/** ↓TODO: */

```