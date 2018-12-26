import Foundation

public func list(_ items: [String]) -> ActionWithOutput {
    return Action(identifier: "is.workflow.actions.list", parameters: ["WFItems": items])
}
