# Expiring Todo

TODOs and FIXMEs should be resolved prior to their expiry date.

* **Identifier:** expiring_todo
* **Enabled by default:** No
* **Supports autocorrection:** No
* **Kind:** lint
* **Analyzer rule:** No
* **Minimum Swift compiler version:** 5.0.0
* **Default configuration:** approaching_expiry_severity: warning, expired_severity: error, bad_formatting_severity: error, approaching_expiry_threshold: 15, date_format: MM/dd/yyyy, date_delimiters: { opening: [, closing: ] }, date_separator: /

## Non Triggering Examples

```swift
// notaTODO:

```

```swift
// notaFIXME:

```

```swift
// TODO: [12/31/9999]

```

```swift
// TODO(note)

```

```swift
// FIXME(note)

```

```swift
/* FIXME: */

```

```swift
/* TODO: */

```

```swift
/** FIXME: */

```

```swift
/** TODO: */

```

## Triggering Examples

```swift
// TODO: [10/14/2019]

```

```swift
// FIXME: [10/14/2019]

```

```swift
// FIXME: [1/14/2019]

```

```swift
// FIXME: [10/14/2019]

```

```swift
// TODO: [9999/14/10]

```