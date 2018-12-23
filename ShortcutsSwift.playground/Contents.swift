import Foundation

func batteryLevel() throws -> Data {
    var batteryLevel = Variable.actionOutput()
    return try exportShortcut(
        comment("This Shortcut was generated in Swift.") +
        getBatteryLevel(&batteryLevel) +
        ifLessThan(20, ifTrue: (
            setLowPowerMode(true) +
            showResult("Your battery is at \(batteryLevel)%, you might want to charge it.")
        ), ifFalse: (
            showResult("Your battery is at \(batteryLevel)%, you're probably fine for now.")
        ))
    )
}

func clapAlong() throws -> Data {
    return try exportShortcut(
        comment("This Shortcut was generated in Swift.") +
        ask(question: "WHAT 👏 DO 👏 YOU 👏 WANT 👏 TO 👏 SAY") +
        changeCase(to: .uppercase) +
        replaceText("[\\s]", replaceWith: " 👏 ", regularExpression: true) +
        chooseFromMenu(items: [
            ("Share", share()),
            ("Copy to Clipboard", copyToClipboard()),
        ])
    )
}

print((try clapAlong() as NSData).description)
