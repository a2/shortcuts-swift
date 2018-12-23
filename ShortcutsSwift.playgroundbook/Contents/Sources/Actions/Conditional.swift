import Foundation

public enum Relation  {
    case equals
    case contains
    case greaterThan
    case lessThan

    var stringValue: String {
        switch self {
        case .equals:
            return "Equals"
        case .contains:
            return "Contains"
        case .greaterThan:
             return "Is Greater Than"
        case .lessThan:
            return "Is Less Than"
        }
    }
}

public enum Value {
    case number(Number)
    case string(String)
}

public func conditional(_ relation: Relation, _ value: Value, ifTrue: ActionContainer, ifFalse: ActionContainer?) -> ActionContainer {
    let groupingIdentifier = UUID().uuidString

    var result = [Action]()

    var startIfParameters: PropertyList = [
        "WFControlFlowMode": 0,
        "GroupingIdentifier": groupingIdentifier,
        "WFCondition": relation.stringValue
    ]
    switch value {
    case .number(let number):
        startIfParameters["WFNumberValue"] = number
    case .string(let string):
        startIfParameters["WFConditionalActionString"] = string
    }
    result.append(Action(identifier: "is.workflow.actions.conditional", parameters: startIfParameters))
    result.append(contentsOf: ifTrue.actions)

    if let ifFalse = ifFalse {
        result.append(Action(identifier: "is.workflow.actions.conditional", parameters: [
            "WFControlFlowMode": 1,
            "GroupingIdentifier": groupingIdentifier
        ]))
        result.append(contentsOf: ifFalse.actions)
    }

    result.append(Action(identifier: "is.workflow.actions.conditional", parameters: [
        "WFControlFlowMode": 2,
        "GroupingIdentifier": groupingIdentifier
    ]))

    return result
}

public func ifLessThan(_ number: Number, ifTrue: ActionContainer, ifFalse: ActionContainer?) -> ActionContainer {
    return conditional(.lessThan, .number(number), ifTrue: ifTrue, ifFalse: ifFalse)
}

public func ifGreaterThan(_ number: Number, ifTrue: ActionContainer, ifFalse: ActionContainer?) -> ActionContainer {
    return conditional(.lessThan, .number(number), ifTrue: ifTrue, ifFalse: ifFalse)
}

public func ifEqualTo(_ number: Number, ifTrue: ActionContainer, ifFalse: ActionContainer?) -> ActionContainer {
    return conditional(.equals, .number(number), ifTrue: ifTrue, ifFalse: ifFalse)
}

public func ifEqualTo(_ string: String, ifTrue: ActionContainer, ifFalse: ActionContainer?) -> ActionContainer {
    return conditional(.equals, .string(string), ifTrue: ifTrue, ifFalse: ifFalse)
}

public func ifContains(_ string: String, ifTrue: ActionContainer, ifFalse: ActionContainer?) -> ActionContainer {
    return conditional(.contains, .string(string), ifTrue: ifTrue, ifFalse: ifFalse)
}
