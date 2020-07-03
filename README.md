This repository has been replaced with [SwiftShortcuts](https://github.com/a2/swift-shortcuts), and is archived for reference.

![Banner](https://raw.githubusercontent.com/a2/shortcuts-swift/master/banner.png)

# Shortcuts Swift

[![Build Status](https://dev.azure.com/pandamonia/shortcuts-swift/_apis/build/status/a2.shortcuts-swift?branchName=master)](https://dev.azure.com/pandamonia/shortcuts-swift/_build/latest?definitionId=3?branchName=master)

[Subscription feed link](https://raw.githubusercontent.com/a2/shortcuts-swift/master/feed.json) or click [here](https://developer.apple.com/ul/sp0?url=https://raw.githubusercontent.com/a2/shortcuts-swift/master/feed.json) on your iPad with Swift Playgrounds 2 installed.

## Example

### Warn for Low Battery Level

```swift
let batteryLevel = actionOutput()
let shortcut = buildShortcut(
    comment("This Shortcut was generated in Swift.") +
    getBatteryLevel().savingOutput(to: batteryLevel) +
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
## Swift Package Manager

```swift
.package(url: "https://github.com/a2/shortcuts-swift", from: "1.0.0")
```

## Contributing

Please read the [Contributions Guide](CONTRIBUTING.md) and the [Code of Conduct](CODE_OF_CONDUCT.md) before getting started. You will need Xcode 10 or newer to build the project.

## Authors

[Alexsander Akers](https://github.com/a2) and [Alexis Aubry](https://github.com/alexaubry)

## License

Shortcuts Swift is available under the MIT license. See the LICENSE file for more info.
