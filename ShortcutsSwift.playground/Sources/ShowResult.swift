import Foundation

public func showResult(_ text: String) -> ActionContainer {
    return Action(identifier: "is.workflow.actions.showresult", parameters: ["Text": withInterpolatedText(text)])
}
