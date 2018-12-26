import Foundation

public func repeatCount(_ actionContainer: ActionContainer, for count: Number) -> ActionContainer {
    let groupingIdentifier = UUID().uuidString
    var result = [Action]()
    let startRepeatParameters: PropertyList = [
        "WFControlFlowMode": 0,
        "GroupingIdentifier": groupingIdentifier,
        "WFRepeatCount" : count
        ]
    
    let endRepeatParameters: PropertyList = [
        "WFControlFlowMode": 2,
        "GroupingIdentifier": groupingIdentifier,
    ]
    result.append(Action(identifier: "is.workflow.actions.repeat.count", parameters: startRepeatParameters))
    result.append(contentsOf: actionContainer.actions)
    result.append(Action(identifier: "is.workflow.actions.repeat.count", parameters: endRepeatParameters))
    return result
}

