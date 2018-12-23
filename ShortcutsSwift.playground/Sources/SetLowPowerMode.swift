import Foundation

public func setLowPowerMode(_ value: Bool = true) -> ActionContainer {
    return Action(identifier: "is.workflow.actions.lowpowermode.set", parameters: ["OnValue": value])
}
