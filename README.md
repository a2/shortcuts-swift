![Banner](https://raw.githubusercontent.com/a2/shortcuts-swift/master/banner.png)

# Shortcuts Swift

[Subscription feed link](https://raw.githubusercontent.com/a2/shortcuts-swift/master/feed.json) or click [here](https://developer.apple.com/ul/sp0?url=https://raw.githubusercontent.com/a2/shortcuts-swift/master/feed.json) on your iPad with Swift Playgrounds 2 installed.

## Example

### Warn for Low Battery Level

```swift
var batteryLevel = Variable.actionOutput()
let shortcut = buildShortcut(
    comment("This Shortcut was generated in Swift.") +
    getBatteryLevel(&batteryLevel) +
    ifLessThan(20, ifTrue: (
        setLowPowerMode(true) +
        showResult("Your battery is at \(batteryLevel)%, you might want to charge it.")
    ), ifFalse: (
        showResult("Your battery is at \(batteryLevel)%, you're probably fine for now.")
    ))
)
```

### Clap Along

```swift
let shortcut = buildShortcut(
    comment("This Shortcut was generated in Swift.") +
    ask(question: "WHAT 👏 DO 👏 YOU 👏 WANT 👏 TO 👏 SAY") +
    changeCase(to: .uppercase) +
    replaceText("[\\s]", replaceWith: " 👏 ", regularExpression: true) +
    chooseFromMenu(items: [
        ("Share", share()),
        ("Copy to Clipboard", copyToClipboard()),
    ])
)
```

## Authors

[Alexsander Akers](https://github.com/a2) and [Alexis Aubry](https://github.com/alexaubry)

## License

Shortcuts Swift is available under the MIT license. See the LICENSE file for more info.
