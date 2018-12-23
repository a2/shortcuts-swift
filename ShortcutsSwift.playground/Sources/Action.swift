import Foundation

public struct Action: PropertyListConvertible {
    let identifier: String
    let parameters: PropertyList

    public var propertyList: PropertyList {
        return [
            "WFWorkflowActionIdentifier": identifier,
            "WFWorkflowActionParameters": parameters
        ]
    }
}

public protocol ActionContainer {
    var actions: [Action] { get }
}

extension Array: ActionContainer where Element == Action {
    public var actions: [Action] {
        return self
    }
}

extension Action: ActionContainer {
    public var actions: [Action] {
        return [self]
    }
}

public func + (lhs: ActionContainer, rhs: ActionContainer) -> ActionContainer {
    let leftActions = lhs.actions
    let rightActions = rhs.actions
    var result = [Action]()
    result.reserveCapacity(leftActions.count + rightActions.count)
    result.append(contentsOf: leftActions)
    result.append(contentsOf: rightActions)
    return result
}
