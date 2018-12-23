import Foundation

public func ask(question: String, defaultAnswer: String = "") -> ActionContainer {
    return Action(identifier: "is.workflow.actions.ask", parameters: [
        "WFAskActionPrompt": withInterpolatedText(question),
        "WFAskActionDefaultAnswer": withInterpolatedText(defaultAnswer),
    ])
}
