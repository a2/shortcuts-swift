var batteryLevel = Variable.actionOutput()
let shortcutName = "Warn for Low Battery Level"
let shortcutData = try exportShortcut(
    comment("This Shortcut was generated in Swift.") +
    getBatteryLevel(&batteryLevel) +
    ifLessThan(20, ifTrue: (
        setLowPowerMode(true) +
        showResult("Your battery is at \(batteryLevel)%, you might want to charge it.")
    ), ifFalse: (
        showResult("Your battery is at \(batteryLevel)%, you're probably fine for now.")
    ))
)
//#-hidden-code
import PlaygroundSupport
if let remoteView = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy {
    remoteView.send(.dictionary([
        "name": .string(shortcutName),
        "data": .data(shortcutData),
    ]))
}
//#-end-hidden-code
