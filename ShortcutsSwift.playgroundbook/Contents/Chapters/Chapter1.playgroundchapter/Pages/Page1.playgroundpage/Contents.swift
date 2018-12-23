var batteryLevel = Variable.actionOutput()
try exportShortcut(
    comment("This Shortcut was generated in Swift.") +
    getBatteryLevel(&batteryLevel) +
    ifLessThan(20, ifTrue: (
        setLowPowerMode(true) +
        showResult("Your battery is at \(batteryLevel)%, you might want to charge it.")
    ), ifFalse: (
        showResult("Your battery is at \(batteryLevel)%, you're probably fine for now.")
    ))
)
