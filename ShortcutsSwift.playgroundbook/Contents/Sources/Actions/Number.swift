import Foundation

extension Int: ActionContainer {
    public var actions: [Action] {
        return [Action(identifier: "is.workflow.actions.number", parameters: ["WFNumberActionNumber":self])]
    }
}

extension Float: ActionContainer {
    public var actions: [Action] {
        return [Action(identifier: "is.workflow.actions.number", parameters: ["WFNumberActionNumber":self])]
    }
}
