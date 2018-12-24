import Foundation

public func replaceText(_ searchString: String, replaceWith replacement: String, caseSensitive: Bool = true, regularExpression: Bool = false) -> ActionWithOutput {
    return Action(identifier: "is.workflow.actions.text.replace", parameters: [
        "WFReplaceTextFind": withInterpolatedText(searchString),
        "WFReplaceTextReplace": withInterpolatedText(replacement),
        "WFReplaceTextCaseSensitive": caseSensitive,
        "WFReplaceTextRegularExpression": regularExpression,
    ])
}
