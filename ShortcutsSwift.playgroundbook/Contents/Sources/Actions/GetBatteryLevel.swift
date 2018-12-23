import Foundation

public func getBatteryLevel(_ output: UnsafePointer<Variable>? = nil) -> ActionContainer {
    let parameters = withActionOutput(output: output)
    return Action(identifier: "is.workflow.actions.getbatterylevel", parameters: parameters)
}
