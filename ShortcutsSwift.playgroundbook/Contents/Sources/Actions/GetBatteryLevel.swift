import Foundation

public func getBatteryLevel() -> ActionWithOutput {
    return Action(identifier: "is.workflow.actions.getbatterylevel", parameters: [:])
}
