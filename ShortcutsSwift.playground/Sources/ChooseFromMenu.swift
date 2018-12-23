import Foundation

public func chooseFromMenu(prompt: String = "", items: [(label: String, actions: ActionContainer)] = []) -> ActionContainer {
    let groupingIdentifier = UUID().uuidString

    var result = [Action]()
    result.append(Action(identifier: "is.workflow.actions.choosefrommenu", parameters: [
        "GroupingIdentifier": groupingIdentifier,
        "WFControlFlowMode": 0,
        "WFMenuItems": items.map { $0.label } as [String],
        "WFMenuPrompt": prompt,
    ]))

    for (label, actionContainer) in items {
        result.append(Action(identifier: "is.workflow.actions.choosefrommenu", parameters: [
            "GroupingIdentifier": groupingIdentifier,
            "WFControlFlowMode": 1,
            "WFMenuItemTitle": label,
        ]))
        result.append(contentsOf: actionContainer.actions)
    }

    result.append(Action(identifier: "is.workflow.actions.choosefrommenu", parameters: [
        "GroupingIdentifier": groupingIdentifier,
        "WFControlFlowMode": 2,
    ]))

    return result
}
