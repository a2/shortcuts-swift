import Foundation

public enum TextCase {
    case uppercase
    case lowercase
    case capitalizeEveryWord
    case capitalizeWithTitleCase
    case capitalizeWithSentenceCase
    case capitalizeWithAlternatingCase
    case askWhenRun

    var parameterValue: Any {
        switch self {
        case .uppercase:
            return "UPPERCASE"
        case .lowercase:
            return "lowercase"
        case .capitalizeEveryWord:
            return "Capitalize Every Word"
        case .capitalizeWithTitleCase:
            return "Capitalize with Title Case"
        case .capitalizeWithSentenceCase:
            return "Capitalize with sentence case."
        case .capitalizeWithAlternatingCase:
            return "cApItAlIzE wItH aLtErNaTiNg CaSe."
        case .askWhenRun:
            return [
                "Value": ["Type": "Ask"] as PropertyList,
                "WFSerializationType": "WFTextTokenAttachment",
            ] as PropertyList
        }
    }
}

public func changeCase(to case: TextCase) -> ActionWithOutput {
    return Action(identifier: "is.workflow.actions.text.changecase", parameters: ["WFCaseType": `case`.parameterValue])
}
